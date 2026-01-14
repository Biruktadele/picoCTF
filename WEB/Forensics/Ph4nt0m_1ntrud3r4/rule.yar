rule YARA_Rule
{
    meta:
        author = "SOC Analyst"
        description = "Detects malware"

    strings:
	$flag = /cGljb0NURg==\{[^\}]+\}/ ascii
    condition:
        any of them
}
