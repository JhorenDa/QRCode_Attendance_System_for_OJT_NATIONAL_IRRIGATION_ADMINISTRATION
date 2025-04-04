from flask import Flask, redirect, url_for, request, render_template, session,jsonify
import pymysql
import qrcode
from datetime import datetime
app = Flask(__name__)


db = pymysql.connect(host="localhost", user="root", password="", database="nia")

cursor = db.cursor()


current_date = datetime.now().date().strftime('%Y-%m-%d')
current_time = datetime.now().time()

@app.route('/')
def home():
    return render_template('loginForm.html')
@app.route('/login', methods=['POST', 'GET'])
def login():
    uname = request.form['username']
    passw = request.form['password']
    cursor.execute("SELECT * FROM admin WHERE userName = %s AND passWord = %s", (uname, passw))
    user = cursor.fetchone()
    if user:
        return redirect(url_for('admin'))
    else:
        return redirect(url_for('home'))
@app.route('/admin')
def admin():
    return render_template('admin.html')

@app.route('/logout')
def logout():
    return redirect(url_for('home'))
#-------------------------------------------------------------------------------------------------------------------------------------------------

@app.route('/register')
def register():
    return render_template('registerForm.html')
@app.route('/registercommit', methods=['POST', 'GET'])
def register_commit():
    name = request.form['fullname']
    uname = request.form['username']
    passw = request.form['password']
    cursor.execute("INSERT INTO admin (fullName, userName, passWord) VALUES (%s, %s, %s)", (name, uname, passw))
    db.commit()
    return redirect(url_for('home'))

#-------------------------------------------------------------------------------------------------------------------------------------------------

@app.route('/reg_ojt/commit', methods=['POST', 'GET'])
def reg_ojt_commit():
    fname = request.form['fname']
    contact = request.form['contact']
    school = request.form['school']
    grade_lvl = request.form['glvl']
    course = request.form['course']
    region = request.form['region']
    city = request.form['city']
    brgy = request.form['brgy']
    street = request.form['street']
    ojt_hours = request.form['hours']
    path = f"{fname}.jpg"
    print(contact)
    cursor.execute("INSERT INTO ojt (name,contact, school, grade_lvl, course, region, city, brgy, street, ojt_hours,path) VALUES (%s,%s, %s, %s, %s, %s, %s, %s, %s, %s,%s)", (fname,contact, school, grade_lvl, course, region, city, brgy, street, ojt_hours,path))
    db.commit()
    
    cursor.execute("SELECT id FROM ojt WHERE name = %s", (fname,))
    ojt_id = cursor.fetchone()

    if ojt_id:
        ojt_id = ojt_id[0]  # Extract integer value from tuple

    db.close()

    # Generate QR code with the clean integer value
    img = qrcode.make(int(ojt_id))
    img.save(f"static/qrcodes/{fname}.jpg")

    
    return render_template('success_reg.html',path=path, fname = fname,  school = school, grade_lvl = grade_lvl, course = course, ojt_hours = ojt_hours)

#-------------------------------------------------------------------------------------------------------------------------------------------------

@app.route('/receive_qr', methods=['POST'])
def receive_qr():
    data = request.form.get('data')
    
    # Ensure data is passed as a tuple
    cursor.execute("SELECT * FROM ojt WHERE id = %s", (data,))
    result = cursor.fetchone()
    if result:
        full_name = result[1]
        
    else:
        return jsonify({"message": "Invalid QR data"}), 400
    
    
    cursor.execute("SELECT * FROM attendance WHERE fullName = %s AND date = %s", (full_name, current_date))
    attendance = cursor.fetchone()
    print(attendance)
    print(current_time)
    print(current_date)
    print(full_name)
    if not attendance :
        if datetime.strptime('06:00:00', '%H:%M:%S').time() <= current_time <= datetime.strptime('12:59:00', '%H:%M:%S').time():
            cursor.execute(
                "INSERT INTO attendance (fullName, morning_time_in, date) VALUES (%s, %s, %s)",
                (full_name, current_time, current_date)
            )
            db.commit()
            return jsonify({"message": f"Morning time in: {current_time}"})
        else:
            cursor.execute(
                "INSERT INTO attendance (fullName, afternoon_time_in, date) VALUES (%s, %s, %s)",
                (full_name, current_time, current_date)
            )
            db.commit()
            return jsonify({"message": f"Afternoon time in: {current_time}"})
    else:
        if datetime.strptime('13:00:00', '%H:%M:%S').time() <= current_time <= datetime.strptime('17:59:00', '%H:%M:%S').time():
            cursor.execute(
                "UPDATE attendance SET afternoon_time_out = %s WHERE fullName = %s AND date = %s",
                (current_time, full_name, current_date)
            )
            db.commit()
            return jsonify({"message": f"Afternoon time out: {current_time}"})
        else:
            cursor.execute(
                "UPDATE attendance SET morning_time_out = %s WHERE fullName = %s AND date = %s",
                (current_time, full_name, current_date)
            )
            db.commit()
            return jsonify({"message": f"Morning time out: {current_time}"})

#-------------------------------------------------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------------------------------------------------
@app.route('/camera')
def camera():
    return render_template('camera.html')



if __name__ == '__main__':
    app.run(debug=True)