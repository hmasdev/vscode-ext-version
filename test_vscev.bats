#!bats

@test '[positive] -h option test' {
    run ./vscev.sh -h
    [ "$status" -eq 0 ]
}

@test '[negative] no option test' {
    run ./vscev.sh
    [ "$status" -eq 1 ]
}

@test '[negative] invalid option test' {
    run ./vscev.sh -x
    [ "$status" -eq 1 ]
}

@test '[negative] no extensionID test' {
    run ./vscev.sh -d
    [ "$status" -eq 1 ]
}

@test '[positive] download option test' {
    run bash -c './vscev.sh -d Github.copilot && ls | grep -o "Github.copilot-.*\.vsix"'
    [ "$status" -eq 0 ]
    [ -n "$output" ]
}

@test '[positive] version test' {
    run bash -c './vscev.sh Github.copilot | grep -P "\d+\.\d+\.\d+"'
    [ "$status" -eq 0 ]
    [ -n "$output" ]
}
