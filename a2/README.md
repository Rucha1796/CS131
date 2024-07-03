# Resume Organizer Script

## What This Command Does
The `resume_organiser.sh` script automates the organization of resumes into structured directories. This script monitors a specified directory for new or updated resume files matching a defined pattern. Upon finding a match, it organizes the resumes into a hierarchical directory structure:
- First, by company name.
- Then, by specific role within that company.

## Why This Command Is Useful
This script saves time and reduces manual effort by:
- Automatically creating directories based on company names.
- Organizing resumes into role-specific subdirectories within each company's directory.
- Ensuring filenames remain consistent and clear, eliminating generic labels like "copy" or "version2".

## When to Use This Command
This command is handy for individuals applying to multiple job positions, especially when:
- Customizing resumes for different roles and companies.
- Needing to keep track of which version of a resume was sent to each employer.
- Desiring a quick and efficient way to manage many customized resume files.

## How you can use this command
Ensure your resume files are named in the format: `FirstNameLastName_RoleName_Company_Resume.pdf.`

To run the script, use the following command format:
```
./resume_organiser.sh <directory to monitor> <pattern> <basepath> <subdirectory>
```

Here is what each argument mean: 

1. Directory to Monitor: The path where your resumes are downloaded or saved.
2. Pattern: The naming pattern to match for processing.
3. Base Path: The root directory where sorted directories will be created.
4. Subdirectory: A primary folder under the base path to start the organization hierarchy.

## Example Usage
```
[ruchasu24@sjsu a2]$ ls
README.md            RuchaDeo_BioinformaticsScientist_Illumina          RuchaDeo_MedicalAnalytics_GSK_Resume.pdf
resume_organiser.sh  RuchaDeo_ComputationalBiologist_Takeda_Resume.pdf
```

To monitor the current directory for any PDF files that include 'Resume' in the filename, and to organize them  under directories named after the respective companies and roles
### Input
```
[ruchasu24@sjsu a2]$ ./resume_organiser.sh . '*_Resume.pdf' . company_specific_resumes
```

### Output
```
Moved ./RuchaDeo_ComputationalBiologist_Takeda_Resume.pdf to ./company_specific_resumes/Takeda/ComputationalBiologist/RuchaDeo_ComputationalBiologist_Takeda_Resume.pdf
Moved ./RuchaDeo_MedicalAnalytics_GSK_Resume.pdf to ./company_specific_resumes/GSK/MedicalAnalytics/RuchaDeo_MedicalAnalytics_GSK_Resume.pdf
^C
```

### Checking the specific folders to confirm the output:
``` 
[ruchasu24@sjsu a2]$ cd company_specific_resumes
[ruchasu24@sjsu company_specific_resumes]$ ls
GSK  Takeda
[ruchasu24@sjsu company_specific_resumes]$ cd GSK
[ruchasu24@sjsu GSK]$ ls
MedicalAnalytics
[ruchasu24@sjsu GSK]$ cd MedicalAnalytics
[ruchasu24@sjsu MedicalAnalytics]$ ls
RuchaDeo_MedicalAnalytics_GSK_Resume.pdf
[ruchasu24@sjsu MedicalAnalytics]$ cd ..
[ruchasu24@sjsu GSK]$ cd ..
[ruchasu24@sjsu company_specific_resumes]$ cd Takeda
[ruchasu24@sjsu Takeda]$ ls
ComputationalBiologist
[ruchasu24@sjsu Takeda]$ cd ComputationalBiologist/
[ruchasu24@sjsu ComputationalBiologist]$ ls
RuchaDeo_ComputationalBiologist_Takeda_Resume.pdf
```
