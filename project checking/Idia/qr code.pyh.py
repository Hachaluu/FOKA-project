# import qrcode

# def generate_qr_code(word):
#     """Generates a QR code for the given word."""
#     qr_code = qrcode.QRCode(version=1, box_size=10, border=5)
#     qr_code.add_data(word)
#     qr_code.make()
#     return qr_code.get_image()

# if __name__ == "__main__":
#     word = input("Enter the word you want to generate a QR code for: ")
#     qr_code = generate_qr_code(word)
#     qr_code.save("qr_code.png")
#     print("QR code generated successfully!")
# print("hey")

def student_info(dorm, cafe):
  """Returns a string with the student's dorm status, cafe usage, and other relevant information."""
  student_info = {
    "dorm": dorm,
    "cafe": cafe,
    "meal plan": "yes" if dorm == "on campus" else "no",
    "cafe loyalty status": "bronze" if cafe == "yes" else "none",
    "spending habits": {
      "average daily spend": 10 if cafe == "yes" else 5
    }
  }
  return json.dumps(student_info)

print(student_info("on campus", "yes"))
print(student_info("off campus", "no"))
