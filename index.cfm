<!---
		This file is part of the SocialBookmarks plugin for Mura CMS, created by
		Megan Garrison. (http://socialbookmarks.riaforge.org/).
		
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
<cfinclude template="plugin/config.cfm" />
<cfsavecontent variable="body">
<cfoutput>
<h2>#request.pluginConfig.getName()#</h2>
<p><em>Version: #request.pluginConfig.getVersion()#</em></p>
<h3>Overview</h3>
<p>This plugin inserts six social bookmarking links (& icons) into your page:
<ul style="margin:10px 10px 10px 30px; font-size:1.1em;">
<li>StumbleUpon</li>
<li>Reddit</li>
<li>Digg</li>
<li>Del.icio.us</li>
<li>Facebook</li>
<li>Twitter (using tinyURL)</li>
</ul>
</p>
<h3>Installation</h3>
<ol>
	<li>Login to your Mura CMS admin</li>
	<li>Click on &quot;Site Settings&quot; on the (yellow) top admin bar.</li>
	<li>Select the &quot;Plugins&quot; tab</li>
	<li>Browse to the location of the SocialBookmarks.zip file Do not extract unless you wish to examine the code. Mura needs to unpack and deploy the zip file.</li>
	<li>Click &quot;Deploy&quot;</li>
	<li>Under &quot;Choose Icon Size&quot; select preferred icon size (in pixels) </li>
	<li>Under &quot;Show on Portal Pages?&quot; choose whether or not you want the buttons to appear under Portal content (Yes/No). </li>
	<li>Under &quot;Site Assignment&quot; select any/all site(s) you wish this plugin assigned to</li>
	<li>Click the &quot;Update&quot; Button</li>
	<li>Go to the &quot;Site Manager&quot; of the site you wish to display this on</li>
	<li>Select a page to edit</li>
	<li>Select the &quot;Content Objects&quot; tab</li>
	<li>From the &quot;Available Content Objects&quot; dropdown, select &quot;Plugins&quot;</li>
	<li>Then select &quot;SocialBookmarks&quot; and choose which area to display on by clicking the &quot;&gt;&gt;&quot; button</li>
	<li>Click &quot;Publish&quot;</li>
</ol>
<p>You will want to add styling to your site.css.</p>
<div style="background:##ccc; width:200px; padding:5px; margin:5px;">
 Example:
<p>ul##socialbookmarks li {<br />
&nbsp; &nbsp; list-style-type: none;<br />
&nbsp; &nbsp; display:inline;<br />
}</p>
</div>
<p> Icons are courtesy of <a href="http://jwloh.deviantart.com/art/Social-me-90694011 target="_blank">Social.me</a> and are located in the <span style="font-weight:bold;">plugins/#request.pluginConfig.getDirectory()#/images</span> folder (in case you want to switch them out).</p>
</cfoutput>
</cfsavecontent>
<cfoutput>
  #application.pluginManager.renderAdminTemplate(body=body,pageTitle=request.pluginConfig.getName())#
</cfoutput>

