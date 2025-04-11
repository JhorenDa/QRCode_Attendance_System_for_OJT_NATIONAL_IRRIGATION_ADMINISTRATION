from flask import Flask, redirect, url_for, request, render_template, session,jsonify
import pymysql
import qrcode
import os
from datetime import datetime
import base64
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
        # Fetch all OJT records as dictionary
        cursor.execute("SELECT * FROM ojt")
        ojts = cursor.fetchall()
        
        # Convert to list of dictionaries if needed (depends on your DB driver)
        ojts_list = []
        for ojt in ojts:
            ojts_list.append({
                'id': ojt[0],
                'name': ojt[1],
                'contact': ojt[2],
                'school': ojt[3],
                'grade_lvl': ojt[4],
                'course': ojt[5],
                'region': ojt[6],
                'city': ojt[7],
                'brgy': ojt[8],
                'street': ojt[9],
                'ojt_hours': ojt[10],
                'path': ojt[11]
            })
        
        return render_template('admin.html', ojts=ojts_list)
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

UPLOAD_FOLDER = 'static/attendance_photos'
os.makedirs(UPLOAD_FOLDER, exist_ok=True)

@app.route('/receive_qr', methods=['POST'])
def receive_qr():
    data = request.form.get('data')
    photo_data = request.form.get('photo')  # Base64 encoded image
    
    # Ensure data is passed as a tuple
    cursor.execute("SELECT * FROM ojt WHERE id = %s", (data,))
    result = cursor.fetchone()
    if not result:
        return jsonify({"message": "Invalid QR data"}), 400
    
    full_name = result[1]
    
    cursor.execute("SELECT * FROM attendance WHERE fullName = %s AND date = %s", (full_name, current_date))
    attendance = cursor.fetchone()
    
    # Save photo if provided
    photo_path = None
    if photo_data:
        try:
            # Convert base64 to image file
            photo_data = photo_data.split(',')[1]  # Remove data URL prefix if present
            image_data = base64.b64decode(photo_data)
            filename = f"{full_name}_{datetime.now().strftime('%Y%m%d_%H%M%S')}.jpg"
            photo_path = os.path.join(UPLOAD_FOLDER, filename)
            with open(photo_path, 'wb') as f:
                f.write(image_data)
            photo_path = filename  # Store relative path
        except Exception as e:
            print(f"Error saving photo: {e}")
    
    if not attendance:
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
                "UPDATE attendance SET afternoon_time_out = %s = %s WHERE fullName = %s AND date = %s",
                (current_time, full_name, current_date)
            )
            db.commit()
            return jsonify({"message": f"Afternoon time out: {current_time}"})
        else:
            cursor.execute(
                "UPDATE attendance SET morning_time_out = %s = %s WHERE fullName = %s AND date = %s",
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