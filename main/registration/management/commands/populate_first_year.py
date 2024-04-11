from django.core.management.base import BaseCommand
from registration.models import FirstYear
import string
import random

class Command(BaseCommand):
    help = 'Copy data from formatted string to FirstYear model'

    def handle(self, *args, **kwargs):
        formatted_data = """
        Sr. No.,Merit No.,MHT-CET Score,Application ID,Name of the Candidate,Gender,Candidate Category,Seat Type
1,2488,99.0182954,EN23174985,POTDAR RAJAS ABHAY,M,OPEN,~ GOPENS
2,2532,98.9989167,EN23113653,RAY SHUBHAM NAVIN,M,OPEN,~ GOPENS
3,2565,98.9936401,EN23180235,NASERI CHIRAG AMIT,M,OPEN,~ GOPENS
4,2653,98.9502201,EN23123728,ANGRE AARY SANJAY,M,OPEN,^ GOPENS
5,2660,98.9495197,EN23149014,BAMISHTE APOORV AMOL,M,OPEN,~ GOPENS
6,2743,98.9155632,EN23126739,HARNE NIDHISH KSHITIJ,M,OPEN,~ GOPENS
7,2811,98.8892492,EN23105613,VEDANT SONAWANE,M,OPEN,*,GOPENS
8,2985,98.8256088,EN23111226,DANDEKAR AMEY VISHWAS,M,OPEN,~ GOPENS
9,3152,98.7654321,EN23163337,GHOGARE SAMARTH SUGRIV,M,OPEN,& GOPENS
10,3394,98.6673674,EN23177423,KULKARNI PRANAV ASHOK,M,OPEN,^ GOPENS
11,3480,98.6419653,EN23186609,GOVILKAR CHINMAY RUTURAJ,M,OPEN,~ GOPENS
12,3524,98.6179074,EN23153487,YASH SHRIVASTAVA,M,OPEN,~ GOPENS
13,3610,98.5811578,EN23182700,THITE ANURAG DEEPAK,M,OPEN,~ GOPENS
14,3711,98.5633908,EN23200672,BEDARKAR ATHARVA AMIT,M,OPEN,^ GOPENS
15,3810,98.5069349,EN23143546,SALGAOKAR ARJUN HEMANT,M,OPEN,~ GOPENS
16,3820,98.5035350,EN23103632,DEVASHISH GHODKI,M,OBC,~ GOPENS
17,3997,98.4460248,EN23138705,ADITYA SANJEEVI,M,OPEN,^ GOPENS
18,4105,98.3975197,EN23222254,UPADHYE SHRAVAN SANTOSH,M,OBC,*,GOBCS
19,4233,98.3419119,EN23141632,DANGE SAURISH JAYANT,M,OPEN,~ ORPHAN
20,4408,98.2807162,EN23171215,VED SHAILESH THOMBRE,M,OPEN,~ GOPENS
21,4857,98.1183995,EN23230235,TANGADPALLIWAR VAMSHI MALLESH,M,NT 1 (NT-B),^ GNT1S
22,4933,98.0786610,EN23133620,LONBALE TANMAY SURESH,M,OBC,~ GOBCS
23,5375,97.9332333,EN23128411,BRAHMANKAR SUMEDH MANOJ,M,OBC,~ GOBCS
24,5646,97.8185350,EN23209881,DHAKNE SATYAM SUDHAKAR,M,NT 3 (NT-D),~ GNT3S
25,5675,97.8134761,EN23228831,KANDALKAR MOHIT MOHANRAO,M,OBC,^ GOBCS
26,6097,97.6528296,EN23185978,WARKE TOSHIT DEVENDRA,M,OBC,~ GOBCS
27,6483,97.5089387,EN23125946,PANDEY ANJALI SANTOSH,F,OPEN,~ LOPENS
28,6507,97.4973970,EN23102033,ANANYA DAS,F,OPEN,^ LOPENS
29,6510,97.4973970,EN23141713,MAYUR VILAS LOKHANDE,M,OBC,^ GOBCS
30,6520,97.4973970,EN23147207,DAWANGE SIDDHESH SANJAY,M,OBC,~ GOBCS
        """
        def generate_random_email(name):
            name_parts = name.split()
            first_name = name_parts[0].lower()
            last_name = name_parts[-1].lower()
            random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
            email = f"{first_name}.{last_name}.{random_string}@gmail.com"
            return email
        # Split the formatted data into lines
        lines = formatted_data.strip().split('\n')

        # Extract the header row
        header = [item.strip() for item in lines[0].split(',')]

        # Initialize an empty list to store student data
        student_data = []

        # Iterate over the lines and extract student data
        for line in lines[1:]:
            parts = [item.strip() for item in line.split(',')]
            if len(parts) == len(header):
                student_dict = {header[i]: parts[i] for i in range(len(header))}
                student_data.append(student_dict)
        # print(student_data[:30])
        # print("LAASDFASDFADSFDF")
        # Iterate over the student data and create FirstYear objects
        for student in student_data[:30]: # Take only the first 30 students
            first_year = FirstYear.objects.create(
                id=int(student['Sr. No.'])+1300,
                rank=int(student['Merit No.']),
                application_id=student['Application ID'],
                email=generate_random_email(student['Name of the Candidate']),
                name=student['Name of the Candidate'],
                branch='ManufacturingEngineering' # Assuming the branch is Civil Engineering for all students
            ).save()

        # Your logic to process the formatted data and save it to the database
