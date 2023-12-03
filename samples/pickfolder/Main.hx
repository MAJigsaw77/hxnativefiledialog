package;

import hxnativefiledialog.NFD;
import hxnativefiledialog.Types;

class Main
{
	public static function main():Void
	{
		var outPath:String = null;

		switch (NFD.PickFolder(null, outPath))
		{
			case NFD_OKAY:
				Sys.println('Success! $outPath');
			case NFD_CANCEL:
				Sys.println('User pressed cancel.');
			default:
				Sys.println('Error: ${NFD.GetError()}');
		}

		Sys.sleep(60);
	}
}
