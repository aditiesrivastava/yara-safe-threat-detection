rule Simulated_Threat_Indicator_Detection
{
    meta:
        description = "Detects artificial indicators in a harmless training text file"
        author = "YARA learning project"
        scope = "Safe simulation only; not a real malware signature"

    strings:
        $alpha = "simulated_indicator_alpha" ascii
        $beta = "simulated_indicator_beta" ascii
        $context = "training_context_2026" ascii

    condition:
        2 of ($alpha, $beta) and $context
}

rule Single_Indicator_Test
{
    strings:
        $test = "simulated_indicator_alpha"

    condition:
        $test
}
