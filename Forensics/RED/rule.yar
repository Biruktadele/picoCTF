rule YARA_Rule
{
    meta:
        author = "SOC Analyst"
        description = "Detects malware"

    strings:
	$flag = /[ -~]{0,}/ ascii

    condition:
        any of them
}
