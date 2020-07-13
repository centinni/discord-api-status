# MILLI_SECONDS () {
#   VAL="$(cut -d'.' -f2 <<<"$1")"
#   $1=$VAL
# }

TIME_NAME_LOOKUP=$(curl "api.centinni.com" -s -o /dev/null -w  "%{time_namelookup}\n")
echo "TIME_NAME_LOOKUP: $TIME_NAME_LOOKUP"

TIME_CONNECT=$(curl "api.centinni.com" -s -o /dev/null -w  "%{time_connect}\n")
echo "TIME_CONNECT: $TIME_CONNECT"

TIME_APP_CONNECT=$(curl "api.centinni.com" -s -o /dev/null -w  "%{time_appconnect}\n")
echo "TIME_APP_CONNECT: $TIME_APP_CONNECT"

TIME_PRE_TRANSFER=$(curl "api.centinni.com" -s -o /dev/null -w  "%{time_pretransfer}\n")
echo "TIME_PRE_TRANSFER: $TIME_PRE_TRANSFER"

TIME_REDIRECT=$(curl "api.centinni.com" -s -o /dev/null -w  "%{time_redirect}\n")
echo "TIME_REDIRECT: $TIME_REDIRECT"

TIME_START_TRANSFER=$(curl "api.centinni.com" -s -o /dev/null -w  "%{time_starttransfer}\n")
echo "TIME_START_TRANSFER: $TIME_START_TRANSFER"

TIME_TOTAL=$(curl "api.centinni.com" -s -o /dev/null -w  "%{time_total}\n")
echo "TIME_TOTAL: $TIME_TOTAL"

YEAR_MONTH_DATE=$(date +%Y-%m-%d)
HOUR_MINUTE_SECOND=$(date +%H:%M:%S)
TIMESTAMP="$YEAR_MONTH_DATE"

# ERROR_COLOR="15814971"
# SUCCESS_COLOR="4437377"
# EMBED_COLOR=0

# if awk 'BEGIN {'$TIME_TOTAL' > 0}'; then
#   echo "Green"
#   echo $SUCCESS_COLOR
#   echo $($EMBED_COLOR = $SUCCESS_COLOR)
# else
#   echo "Red"
#   echo $ERROR_COLOR
#   echo $($EMBED_COLOR = $ERROR_COLOR)
# fi

# echo $EMBED_COLOR

echo "Start command to Discord"
curl -X POST \
  -H 'Content-type: application/json' \
  -d '{
    "embeds": [
      {
        "title": "'$TIME_TOTAL'ms",
        "color": 4178537,
        "fields": [
          {
            "name": "TIME_NAME_LOOKUP",
            "value": "'$TIME_NAME_LOOKUP'ms",
            "inline": true
          },
          {
            "name": "TIME_CONNECT",
            "value": "'$TIME_CONNECT'ms",
            "inline": true
          },
          {
            "name": "TIME_APP_CONNECT",
            "value": "'$TIME_APP_CONNECT'ms",
            "inline": true
          },
          {
            "name": "TIME_PRE_TRANSFER",
            "value": "'$TIME_PRE_TRANSFER'ms",
            "inline": true
          },
          {
            "name": "TIME_REDIRECT",
            "value": "'$TIME_REDIRECT'ms",
            "inline": true
          },
          {
            "name": "TIME_START_TRANSFER",
            "value": "'$TIME_START_TRANSFER'ms",
            "inline": true
          }
        ],
        "author": {
          "name": "GitHub Actions",
          "url": "https://github.com/centinni/backend/actions/runs/161686149",
          "icon_url": "https://cdn.discordapp.com/attachments/731053691066646528/731392186079510528/logo.png"
        },
        "footer": {
          "text": "ペングークン"
        },
        "timestamp": "'$TIMESTAMP'" 
      }
    ]
  }' $DISCORD_API_STATUS_WEBHOOK
echo "End command to Discord"
