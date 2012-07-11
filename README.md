## Survey tool for iOS (iPhone and iPad)

Create your Surveys on iOS dynamically without the need to Compile and Push to app store.
The views are controlled by JSON. The sample json:

```ruby
{
	"1": {
		"q": "The Question",
		"key": "Will be used to store answers"
		"type": "check|slider|ui_picker|control|text"
		"op": [
			{
				"key": "Key for option",
				"value": "Value for option"
			}
			.....
		]
	}
	....
}

```

For deatils of JSON look at ``resources\questions.json`` for reference.

The screenshot of current implementation:

<img src="/docs/Landing.png" />

* Other pages:

![Other page](https://github.com/toamitkumar/Survey/raw/master/docs/CheckBox.png)

![Other page](https://github.com/toamitkumar/Survey/blob/master/docs/Segment.png)

![Other page](https://github.com/toamitkumar/Survey/blob/master/docs/Slider.png)

![Other page](https://github.com/toamitkumar/Survey/blob/master/docs/UI_Picker.png)

## Forking

Feel free to fork and submit pull requests!

## Todo

- Create views for iPad, current views are only for iPhone
- Create RailsAPI which feeds JSON when online.
- Improve storage - UIDocument or CoreData or FMDB