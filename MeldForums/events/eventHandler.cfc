﻿<!---
||MELDFORUMSLICENSE||
--->
<cfcomponent extends="mura.plugin.pluginGenericEventHandler">
	<cfset variables.framework=getFrameworkVariables()>

	<cffunction name="onApplicationLoad">
		<cfargument name="$">

		<cfset var appreloadKey = $.GlobalConfig().getValue('appreloadKey') />

		<cfif len( appreloadKey ) and structKeyExists(url,appreloadKey)> 
			<cfset url[variables.framework.reload] = true />
		</cfif>

		<!--- invoke onApplicationStart in the application.cfc so the framework can do its thing --->
		<cfinvoke component="#pluginConfig.getPackage()#.Application" method="onApplicationStart" />

		<cfset variables.pluginConfig.addEventHandler(this)>
	</cffunction>

<!---
	<cffunction name="onMeldForumsDisplayConferenceForum">
		<cfargument name="$">
		
		<cfset var sStruct = StructNew() />
		<cfset var content = $.event().getValue("content") />
		
		<cfset structInsert( sStruct,"25","second<br>") />
		<cfset structInsert( sStruct,"4","first<br>") />
		<cfset structInsert( sStruct,"1322","third<br>") />
		
		<cfset StructAppend( content.stats,sStruct ) />
	</cffunction>
--->

<!---
	<cffunction name="onMeldForumsDisplayConference">
		<cfargument name="$">
		
		<cfset var labels = $.event().getValue("labels") />

		<cfset labels.lastpost = "My Last Posts" />
		
	</cffunction>
--->
	<cffunction name="onSiteRequestInit">
		<cfargument name="$">
		
		<cfset var app 					= variables.pluginConfig.getApplication() />
		<cfset var beanFactory			= app.getValue('beanFactory') />
		<cfset var cFileName			= $.event().getValue('currentfilename') />
		<cfset var filenameMarker		= refindNoCase("\/mf[$|/]",$.event().getValue('currentfilename')) />
		<cfset var pathMarker			= refindNoCase("\/mf[$|/]",$.event().getValue('path')) />

		<cfset var meldForumsManager	= "" />

		<cfset var aIntercept			= ArrayNew(1) />
		<cfset var sIntercept			= "" />

		<cfif not filenameMarker or isSimpleValue(beanFactory)>
			<cfreturn />
		</cfif>

		<cfset meldForumsManager		= beanFactory.getBean('MeldForumsManager') />
		

		<cfset $.event().setValue('currentfilename',left( cFileName,filenameMarker-1 )) />
		<cfset $.event().setValue('path', left( $.event().getValue('path'),pathMarker-1 ) & "/" ) />

		<cfif len( $.event().getValue('currentfilenameadjusted') )>
			<cfset $.event().setValue('currentfilenameadjusted',left( cFileName,filenameMarker-1 )) />
		</cfif>

		<cfset sIntercept = mid( cFileName,filenameMarker+4,len(cFileName) ) />
	
		<cfif len( sIntercept )>
			<cfset aIntercept = ListToArray( sIntercept,"/" ) />
		</cfif>

		<cfif ArrayLen( aIntercept )>
			<cfset meldForumsManager.processIntercept( $,aIntercept ) />
		</cfif>
	</cffunction>

	<cffunction name="getFrameworkVariables" output="false" access="private">
		<cfset var framework = StructNew() />

		<cfinclude template="../frameworkConfig.cfm" />

		<cfreturn framework />		
	</cffunction>
</cfcomponent>