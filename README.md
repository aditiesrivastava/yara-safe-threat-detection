# YARA-Based Threat Detection Using Safe Test Samples

## Project scope
This beginner project demonstrates YARA rule logic using harmless plain-text files containing artificial indicators. It does **not** use real malware and does not claim to detect any real malware family.

## Included files
- `safe_training_rule.yar` — two YARA rules used in the tests.
- `samples/sample_suspicious.txt` — plain text containing artificial indicators.
- `samples/sample_clean.txt` — control file intended not to match.
- `samples/sample_one_indicator.txt` — plain text containing one artificial indicator.
- `evidence/screenshots/` — selected terminal screenshots in test order.
- `reports/YARA_Project_Documentation.docx` — detailed report with test evidence.

## Rules
1. `Simulated_Threat_Indicator_Detection` requires the context string and at least two strings from the group `($alpha, $beta)`.
2. `Single_Indicator_Test` matches when `simulated_indicator_alpha` is present.

## Reproduce on Windows
Open Command Prompt in this project folder and run (adjust the YARA executable path if yours differs):

```bat
"C:\Users\KIIT\Downloads\yara-v4.4.0-2250-win64\yara64.exe" safe_training_rule.yar samples\sample_suspicious.txt
"C:\Users\KIIT\Downloads\yara-v4.4.0-2250-win64\yara64.exe" safe_training_rule.yar samples\sample_clean.txt
"C:\Users\KIIT\Downloads\yara-v4.4.0-2250-win64\yara64.exe" -r safe_training_rule.yar samples
```

Expected:
- `sample_suspicious.txt` matches both rules.
- `sample_clean.txt` produces no match output.
- Recursive scan reports matching rules for files that contain their indicators.

## Limitations
These artificial indicators only validate rule behavior on controlled examples. They do not measure real-world malware detection performance, false-positive rates across a representative benign corpus, or effectiveness against actual malware.
