package main.mvc.model
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import org.edgardz.utils.rand;

	public class SiteModel
	{
		public static function loadSiteData( callBack:Function ):void
		{
			var	dataLoader:URLLoader = new URLLoader();
				dataLoader.addEventListener(Event.COMPLETE, onDataLoaded, false, 0, true);
				dataLoader.load( new URLRequest("json/sitedata.json?" + rand()) );
			
			function onDataLoaded(e:Event):void
			{
				callBack(e.target.data);
			}
		}
	}
}