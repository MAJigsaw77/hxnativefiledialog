package;

import hxnativefiledialog.NFD;
import hxnativefiledialog.Types;

class Main
{
	public static function main():Void
	{
		var savePath:String = null;

		switch (NFD.SaveDialog("png,jpg;pdf", null, savePath))
		{
			case NFD_OKAY:
				Sys.println('Success! $savePath');
			case NFD_CANCEL:
				Sys.println('User pressed cancel.');
			default:
				Sys.println('Error: ${NFD.GetError()}');
		}
	}
}
