#!/bin/bash

api="https://api.punkapi.com/v2"
user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36"

function get_beers() {
    # 1 - beer_name: (string): <beer_name - default: "">
    # 2 - abv_gt: (number): <abv_gt - default: 0>
		# 3 - abv_lt: (number): <abv_lt - default: 100>
		# 4 - ibu_gt: (number): <ibu_gt - default: 0>
		# 5 - ibu_lt: (number): <ibu_lt - default: 100>
		# 6 - ebc_gt: (number): <ebc_gt - default: 0>
		# 7 - ebc_lt: (number): <ebc_lt - default: 100>
		# 8 - yeast: (string): <yeast - default: "">
		# 9 - brewed_before: (string): <date - default: "">
		# 10 - brewed_after: (string): <date - default: "">
		# 11 - hops: (string): <hops - default: "">
		# 12 - malt: (string): <malt - default: "">
		# 13 - food: (string): <food - default: "">
		# 14 - ids: (string): <ids - default: "">
		# 15 - page: (integer): <page - default: 1>
		# 16 - per_page: (integer): <per_page - default: 25>
		curl --request GET \
				--url "$api/beers?beer_name=${1:-""}&abv_gt=${2:-0}&abv_lt=${3:-100}&ibu_gt=${4:-0}&ibu_lt=${5:-100}&ebc_gt=${6:-0}&ebc_lt=${7:-100}&yeast=${8:-""}&brewed_before=${9:-""}&brewed_after=${10:-""}&hops=${11:-""}&malt=${12:-""}&food=${13:-""}&ids=${14:-""}&page=${15:-1}&per_page=${16:-25}" \
				--user-agent "$user_agent" \
				--header "accept: application/json"
}

function get_random_beer() {
		curl --request GET \
				--url "$api/beers/random" \
				--user-agent "$user_agent" \
				--header "accept: application/json"
}

function get_beer_by_id() {
		# 1 - id: (integer): <id - required>
		curl --request GET \
				--url "$api/beers/${1:?id is required}" \
				--user-agent "$user_agent" \
				--header "accept: application/json"
}
