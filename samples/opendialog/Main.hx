package;

import hxnativefiledialog.NFD;
import hxnativefiledialog.Types;

class Main
{
	public static function main():Void
	{
		var outPath:cpp.CharStar = null;

		var result:NFDResult_T = NFD.OpenDialog("png,jpg;pdf", null, outPath);

		switch (result)
		{
			case NFD_OKAY:
				Sys.println('Success! $outPath');
			case NFD_CANCEL:
				Sys.println('User pressed cancel.');
			default:
				Sys.println('Error: ${NFD.GetError()}');
		}
	}
}
