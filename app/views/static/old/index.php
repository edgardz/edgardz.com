<html>
	<head>
		<title>Edgard Zavarezzi - Generalist Developer</title>
		<link rel="stylesheet" type="text/css" href="css/geral.css" >
		<script type="text/javascript" src="js/AC_OETags.js"></script>
		<script type="text/javascript" src="js/swfobject.js"></script>
        <script type="text/javascript" src="js/swfaddress.js"></script>
        <script type='text/javascript' src='js/jquery.min.js'></script> 
		<script type='text/javascript' src='js/jquery.scrollTo-min.js'></script> 
	</head>
	<body>
		<script language="javascript" type="text/javascript">
			 //<![CDATA[
				var requiredMajorVersion = 10;
				var requiredMinorVersion = 0;
				var requiredRevision = 0;
				var hasReqestedVersion = DetectFlashVer(requiredMajorVersion, requiredMinorVersion, requiredRevision);
			
				if (!hasReqestedVersion) 
				{
					window.location = "noflash.html";
				}
			
				var flashvars = {};     
				 
				var params = {        
					quality: "high",
					align: "middle",
					wmode: "window",
					devicefont: "false",
					menu: "false",
					allowFullScreen: "false",
					allowScriptAccess: "always",
					salign: "LT"
				};
				
				var attributes = {};  
				
				swfobject.embedSWF("Main.swf", "conteudoFlash", "100%", "100%", "10.0.0", "expressInstall.swf", flashvars, params, attributes);
				
				function setHeight(value)
				{
					document.getElementById("conteudoFlash").style.height = value;
				}
				
				var prevScroll = 0;
				
				function scrollTo(value)
				{
					prevScroll = document.body.scrollTop || window.pageYOffset || (document.body.parentElement ? document.body.parentElement.scrollTop : 0 );
					$.scrollTo( value, 400 );
				}
				
				function scrollToPrev()
				{
					$.scrollTo( prevScroll, 400 );
				}

				
			//]]>
		</script>

		<div id="conteudoFlash">
			<!-- SEO -->
			<?php
			
				function safeJSON_chars($data) 
				{ 
					$aux = str_split($data); 
				
					foreach($aux as $a) 
					{
						$a1 = urlencode($a); 
						$aa = explode("%", $a1); 
						
						foreach($aa as $v) 
						{ 
							if($v!="") 
							{ 
								if(hexdec($v)>127) 
								{ 
									$data = str_replace($a,"&#".hexdec($v).";",$data); 
								} 
							} 
						} 
					} 
					return $data; 
				} 
				
				$jsonFileContents = file_get_contents('json/sitedata.json');
				$sitedata = json_decode( safeJSON_chars($jsonFileContents) );
				
				echo 	"<center>",
						"<h1>About</h1>\n",
						"<p>".$sitedata->{'about'}."</p><br/>",
						"<h1>Gallery</h1><br/>\n";

				foreach( $sitedata->{'jobs'} as $job )
				{
					echo 	"<p><h2><a href='".$job->{'link'}."'>".$job->{'title'}."</a></h2>\n",
							"Client: ".$job->{'client'}." <br/>\n",
							"Plataform: ".$job->{'plataform'}." <br/>\n",
							"Agency: ".$job->{'agency'}." <br/>\n",
							"Company: ".$job->{'company'}." <br/>\n",
							"Roles: ".$job->{'roles'}." <br/>\n";
					
					foreach( $job->{'images'} as $img )
					{
						echo "<a href='".$job->{'link'}."'><img src='img/".$img."' alt='".$job->{'title'}."' /></a><br/>\n";
					}
					
					echo	"</p><br/><br/>";
				}
				
				echo 	"<h1>Contact</h1>\n",
						"<p>ed@edgardz.com <br/>\n",
						"+55 11 8558.0660<br/>\n",
						"msn | gtalk: edgardz@gmail.com <br/>\n",
						"skype: edgardzavarezzi <br/>\n",
						"<a href='http://twitter.com/edgardz'>Twitter</a> ",
						"<a href='http://www.facebook.com/edgardzavarezzi'>Facebook</a> ",
						"<a href='http://www.linkedin.com/pub/edgard-zavarezzi/a/602/50a'>LinkedIn</a>",
						"</center><br/><br/><br/><br/>";

			?>
		</div>
		
			<script type="text/javascript">
			  var _gaq = _gaq || [];
			  _gaq.push(['_setAccount', 'UA-11612239-1']);
			  _gaq.push(['_trackPageview']);
			  (function() {
			    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
			    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
			    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
			  })();
			</script>
			
	</body>
</html>