rule YARA_Rule
{
    meta:
        author = "SOC Analyst"
        description = "Detects malware"

    strings:
	$flag = /picoCTF\{[^\}]+\}/ ascii
    condition:
        any of them
}
