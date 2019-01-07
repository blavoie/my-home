#!/usr/bin/env bash

USER_NAME=${USER_NAME:-boostnote}

id -u ${USER_NAME} > /dev/null 2>&1
if [ $? -eq 1 ]; then

    # Check for unset environment variables
    if [[ -z ${USER_ID} || -z ${GROUP_ID} ]]; then
        echo "USER_ID and GROUP_ID environment variables must be set."
        exit 1
    fi

    # Create user
    groupadd -g ${GROUP_ID} ${USER_NAME}
    useradd -u ${USER_ID} -g ${GROUP_ID} --create-home ${USER_NAME} > /dev/null 2>&1
    chown ${USER_ID}:${GROUP_ID} /home/${USER_NAME}

fi

gosu ${USER_NAME} "$@"
