#!/usr/bin/python3
"""Contains top_ten function"""
import requests


def top_ten(subreddit):
    """Print the titles of the 10 hottest posts on a given subreddit."""
    # Convert subreddit to lowercase for consistency
    url = "https://www.reddit.com/r/{}/hot.json".format(subreddit.lower())
    headers = {
        "User-Agent": "0x16-api_advanced:project:\
v1.0.0 (by /u/firdaus_cartoon_jr)"
    }
    params = {
        "limit": 10
    }

    response = requests.get(url, headers=headers, params=params,
                            allow_redirects=False)

    # Check for any non-200 status code
    if response.status_code != 200:
        print(None)
        return

    try:
        results = response.json().get("data")
        children = results.get("children", [])

        # Handle case where subreddit exists but has no posts
        if not children:
            print(None)
            return

        # Print titles one by one
        for child in children:
            print(child.get("data").get("title"))
    except Exception:
        print(None)
