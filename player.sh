#!/bin/bash

# List of YouTube video URLs and their corresponding names
urls=(
	"https://youtu.be/BUuQjIIG0lc?si=2fZ868XDtZfh4dLg|Va Madurai"
	"https://youtu.be/yH7eDWTH5iM?si=Vs4MJ696l_axpN61|Illuminati"
	"https://youtu.be/8FAUEv_E_xQ?si=LSefukjqvkh4k7yS|Arabic Kuthu"
	"https://youtu.be/L0MK7qz13bU?si=HE6z1Ky5Ok9RHgx3|Let it go"
	"https://youtu.be/0PgaZ_6YXy0?si=bA5rqnp2ad5gat2o|Deadpool Rap"
	"https://youtu.be/ijBxe70sd8M?si=TmTdFkZfXLwdUPb0|Achacho"
	"https://youtu.be/zZYPFY4r1rA?si=Ol-Tr-cbI4OWS-q0|Thumbi"
	"https://youtu.be/XJx3YMdnujc?si=4JBPo2kraQsAbfj9|Chekuthan"
	"https://youtu.be/n_wnI0k6AOY?si=ZrXqI6RzC6LecK54|CIA"
	"https://youtu.be/Dm-YtJKwigg?si=iBmvny3BnB0vSQDz|Mickey virus"
	"https://youtu.be/fL-6hrbvSHU?si=e2_7O6AcgzkO9i1s|Pyaar china ka maal hai"
	"https://youtu.be/EFuwK9C6vO4?si=cDrusnE-hRgSWCbB|Marvel Anthem"
	"https://youtu.be/zl1CsDDmN6s?si=fcw6wuZaF83B3lxO|Aarambhame Le"
	"https://youtu.be/5v2Y54mviv0?si=H5K-U5vmvEUNdpDx|Ennilerinju Thudangiya"
	"https://youtu.be/poRVmkuLLpg?si=lWYnIZVcweffMhwt|Innalekalil"
	"https://youtu.be/AIUieMpmAr8?si=K3wscSaYBg_OUhNP|Ranam Title Track"
)

# Display the list of videos
echo "Select a Music to play:"
for i in "${!urls[@]}"; do
	url_and_title="${urls[$i]}"
	title="${url_and_title##*|}"
	echo "$((i + 1)). $title"
done

# Prompt the user for input
read -p "Enter the number of the music you want to play: " selection

# Validate the input
if [[ $selection -lt 1 || $selection -gt ${#urls[@]} ]]; then
	echo "Invalid selection. Please enter a number between 1 and ${#urls[@]}."
	exit 1
fi

# Function to play a video
play_video() {
	local index="$1"
	while true; do
		url_and_title="${urls[$index]}"
		url="${url_and_title%%|*}"
		title="${url_and_title##*|}"
		echo "Now playing: $title"
		mpv --no-video "$url"
		index=$(( (index + 1) % ${#urls[@]} ))
	done
}

# Play the selected video and continue with the next one in the list
play_video $((selection - 1))
