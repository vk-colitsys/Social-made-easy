<!---
		This file is part of the SocialBookmarks plugin for Mura CMS, created by
		Megan Garrison (http://socialbookmarks.riaforge.org/). 
		
		This plugin is free software: you can redistribute it and/or modify
		it under the terms of the GNU General Public License as published by
		the Free Software Foundation, Version 2 of the License.
		
		This plugin is distributed in the hope that it will be useful,
		but WITHOUT ANY WARRANTY; without even the implied warranty of
		MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
		GNU General Public License for more details.

		You should have received a copy of the GNU General Public License
		along with Mura CMS.  If not, see <http://www.gnu.org/licenses/>.
--->

<cfcomponent extends="mura.plugin.pluginGenericEventHandler">
	
	<cffunction name="renderSocial" output="false" returntype="any">		
		<cfargument name="event">
		
		<cfset var local = structNew() />
		<cfset local.str = "" />
		<cfset local.imgpath = application.configBean.getContext() & "/plugins/" &   variables.pluginConfig.getDirectory() & "/images/" & variables.pluginConfig.getSetting("iconSize") />
		<cfset local.portalShow = variables.pluginConfig.getSetting("portalShow")>
		<cfset local.tinyURL = "" />
		<cfset local.pageURL = request.contentrenderer.getCurrentURL(complete=true) />
		<cfset local.pageTitle = request.contentBean.getHTMLTitle() />
		<cfset local.contentType = request.contentBean.getValue("type")  />
		<cfhttp url="http://www.tinyurl.com/api-create.php?url=#urlencodedformat(local.pageURL)#" method="GET" result="response">

		<cfif ucase(trim(response.StatusCode)) eq '200 OK'>
			<cfset local.tinyURL = response.FileContent>
		<cfelse>
			<cfset local.tinyURL = local.pageURL>
		</cfif> 
<cfif (local.contentType neq "Portal") OR (local.portalShow eq 1)>
			<cfsavecontent variable="local.str">			
			<cfoutput>
<!-- begin Social Bookmarks -->
<ul id="socialbookmarks">                  
	<li><a href="http://www.stumbleupon.com/submit?url=#local.pageURL#&amp;amp;title=#HTMLEditFormat(local.pageTitle)#" title="Stumble Us!"><img src="#local.imgpath#/stumbleupon.png" alt="Stumble" /></a></li>
	<li><a href="http://www.reddit.com/submit?url=#local.pageURL#&amp;amp;title=#HTMLEditFormat(local.pageTitle)#" title="Vote on Reddit!"><img src="#local.imgpath#/reddit.png" alt="Reddit" /></a></li>
	<li><a href="http://digg.com/submit?phase=2&amp;amp;url=#local.pageURL#&amp;amp;title=#HTMLEditFormat(local.pageTitle)#" title="Add us to Digg"><img src="#local.imgpath#/digg.png" alt="Digg" /></a></li>
	<li><a href="http://del.icio.us/post?url=#local.pageURL#&amp;amp;title=#HTMLEditFormat(local.pageTitle)#" title="Bookmark on Delicious!"><img src="#local.imgpath#/delicious.png" alt="Delicious" /></a></li>	
                    <li><a href="http://www.facebook.com/sharer.php?u=#local.pageURL#&amp;amp;t=#HTMLEditFormat(local.pageTitle)#" title="Share on Facebook!"><img src="#local.imgpath#/facebook.png" alt="Share on Facebook" /></a></li>
                    <li><a href="http://twitter.com/home/?status=#HTMLEditFormat(local.pageTitle)# : #local.tinyURL#" title="Tweet this!"><img src="#local.imgpath#/twitter.png" alt="Tweet this!" /></a></li> 
</ul> 
<!-- end Social Bookmarks -->
			</cfoutput>

			</cfsavecontent>
		<cfreturn local.str />
</cfif>
	</cffunction>

</cfcomponent>