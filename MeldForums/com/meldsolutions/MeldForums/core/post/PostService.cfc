<!---||MELDFORUMSLICENSE||--->
<cfcomponent name="PostService" output="false" extends="MeldForums.com.meldsolutions.core.MeldService">
<!---^^GENERATEDSTART^^--->
	<cffunction name="init" access="public" output="false" returntype="PostService">
		<cfreturn this/>
	</cffunction>

	<cffunction name="createPost" access="public" output="false" returntype="any">
		<!---^^ATTRIBUTES-START^^--->
		<cfargument name="PostID" type="uuid" required="false" />
		<cfargument name="ThreadID" type="string" required="false" />
		<cfargument name="UserID" type="string" required="false" />
		<cfargument name="AdminID" type="string" required="false" />
		<cfargument name="Message" type="string" required="false" />
		<cfargument name="IsActive" type="boolean" required="false" />
		<cfargument name="IsDisabled" type="boolean" required="false" />
		<cfargument name="IsApproved" type="boolean" required="false" />
		<cfargument name="IsUserDisabled" type="boolean" required="false" />
		<cfargument name="IsModerated" type="boolean" required="false" />
		<cfargument name="DateModerated" type="string" required="false" />
		<cfargument name="DoBlockAttachment" type="boolean" required="false" />
		<cfargument name="AttachmentID" type="string" required="false" />
		<cfargument name="PostPosition" type="numeric" required="false" />
		<cfargument name="RemoteID" type="string" required="false" />
		<cfargument name="DateCreate" type="string" required="false" />
		<cfargument name="DateLastUpdate" type="string" required="false" />
		<cfargument name="Idx" type="numeric" required="false" />
		<cfargument name="ParentID" type="string" required="false" />
		<!---^^ATTRIBUTES-END^^--->
				
		<cfset var tmpObj = createObject("component","PostBean").init(argumentCollection=arguments) />
		<cfset tmpObj.setPostService( this ) />
		<cfreturn tmpObj />
	</cffunction>

	<cffunction name="getPost" access="public" output="false" returntype="any">
		<!---^^PRIMARY-START^^--->
		<cfargument name="PostID" type="uuid" required="true" />
		<!---^^PRIMARY-END^^--->
		
		<cfset var PostBean = createPost(argumentCollection=arguments) />
		<cfset getPostDAO().read(PostBean) />
		<cfreturn PostBean />
	</cffunction>

	<cffunction name="getPosts" access="public" output="false" returntype="array">
		<!---^^ATTRIBUTES-START^^--->
		<cfargument name="PostID" type="uuid" required="false" />
		<cfargument name="ThreadID" type="string" required="false" />
		<cfargument name="UserID" type="string" required="false" />
		<cfargument name="AdminID" type="string" required="false" />
		<cfargument name="Message" type="string" required="false" />
		<cfargument name="IsActive" type="boolean" required="false" />
		<cfargument name="IsDisabled" type="boolean" required="false" />
		<cfargument name="IsApproved" type="boolean" required="false" />
		<cfargument name="IsUserDisabled" type="boolean" required="false" />
		<cfargument name="IsModerated" type="boolean" required="false" />
		<cfargument name="DateModerated" type="string" required="false" />
		<cfargument name="DoBlockAttachment" type="boolean" required="false" />
		<cfargument name="AttachmentID" type="string" required="false" />
		<cfargument name="PostPosition" type="numeric" required="false" />
		<cfargument name="RemoteID" type="string" required="false" />
		<cfargument name="DateCreate" type="string" required="false" />
		<cfargument name="DateLastUpdate" type="string" required="false" />
		<cfargument name="Idx" type="numeric" required="false" />
		<cfargument name="ParentID" type="string" required="false" />
		<!---^^ATTRIBUTES-END^^--->
		<cfargument name="pageBean" type="any" required="false" />
		
		<cfreturn getPostGateway().getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="getBeanByAttributes" access="public" output="false" returntype="any">
		<!---^^ATTRIBUTES-START^^--->
		<cfargument name="PostID" type="uuid" required="false" />
		<cfargument name="ThreadID" type="string" required="false" />
		<cfargument name="UserID" type="string" required="false" />
		<cfargument name="AdminID" type="string" required="false" />
		<cfargument name="Message" type="string" required="false" />
		<cfargument name="IsActive" type="boolean" required="false" />
		<cfargument name="IsDisabled" type="boolean" required="false" />
		<cfargument name="IsApproved" type="boolean" required="false" />
		<cfargument name="IsUserDisabled" type="boolean" required="false" />
		<cfargument name="IsModerated" type="boolean" required="false" />
		<cfargument name="DateModerated" type="string" required="false" />
		<cfargument name="DoBlockAttachment" type="boolean" required="false" />
		<cfargument name="AttachmentID" type="string" required="false" />
		<cfargument name="PostPosition" type="numeric" required="false" />
		<cfargument name="RemoteID" type="string" required="false" />
		<cfargument name="DateCreate" type="string" required="false" />
		<cfargument name="DateLastUpdate" type="string" required="false" />
		<cfargument name="Idx" type="numeric" required="false" />
		<cfargument name="ParentID" type="string" required="false" />
		<!---^^ATTRIBUTES-END^^--->

		<cfreturn getPostGateway().getBeanByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="getByArray" access="public" output="false" returntype="Query" >
		<cfargument name="idArray" type="array" required="true" />

		<cfreturn getPostGateway().getByArray(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="search" access="public" output="false" returntype="struct">
		<cfargument name="criteria" type="struct" required="true" />
		<cfargument name="fieldList" type="string" required="false" default="*" />
		<cfargument name="start" type="numeric" required="false" default="0"/>
		<cfargument name="size" type="numeric" required="false" default="10"/>
		<cfargument name="count" type="numeric" required="false" default="0"/>
		<cfargument name="isPaged" type="numeric" required="false" default="true" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var arrObjects		= ArrayNew(1)>
		<cfset var iiX				= "" >
		<cfset var isValid			= false >
		<cfset var sReturn			= StructNew()>
		
		<cfif arguments.isPaged and not arguments.count>
			<cfset arguments.isCount = true>
			<cfset sReturn.count = getPostGateway().search(argumentCollection=arguments) />
			<cfset arguments.isCount = false>
		<cfelse>
			<cfset sReturn.count = arguments.count />
		</cfif>
		
		<cfset arrObjects = getPostGateway().search(argumentCollection=arguments) />

		<cfset sReturn.start		= arguments.start />
		<cfset sReturn.size			= arguments.size />
		<cfset sReturn.itemarray	= arrObjects />

		<cfreturn sReturn />
	</cffunction>

	<cffunction name="savePost" access="public" output="false" returntype="boolean">
		<cfargument name="PostBean" type="any" required="true" />

		<cfreturn getPostDAO().save(PostBean) />
	</cffunction>
	
	<cffunction name="updatePost" access="public" output="false" returntype="boolean">
		<cfargument name="PostBean" type="any" required="true" />

		<cfreturn getPostDAO().update(PostBean) />
	</cffunction>

	<cffunction name="deletePost" access="public" output="false" returntype="boolean">
		<!---^^PRIMARY-START^^--->
		<cfargument name="PostID" type="uuid" required="true" />
		<!---^^PRIMARY-END^^--->
		
		<cfset var PostBean = createPost(argumentCollection=arguments) />
		<cfreturn getPostDAO().delete(PostBean) />
	</cffunction>

	<cffunction name="setPostGateway" access="public" returntype="void" output="false">
		<cfargument name="PostGateway" type="any" required="true" />
		<cfset variables['postGateway'] = arguments.PostGateway />
	</cffunction>
	<cffunction name="getPostGateway" access="public" returntype="any" output="false">
		<cfreturn PostGateway />
	</cffunction>

	<cffunction name="setPostDAO" access="public" returntype="void" output="false">
		<cfargument name="PostDAO" type="any" required="true" />
		<cfset variables['postDAO'] = arguments.PostDAO />
	</cffunction>
	<cffunction name="getPostDAO" access="public" returntype="any" output="false">
		<cfreturn variables.PostDAO />
	</cffunction>

<!---^^GENERATEDEND^^--->
<!---^^CUSTOMSTART^^--->

	<cffunction name="getCount" access="public" output="false" returntype="number">
		<cfargument name="threadID" type="uuid" required="false" />

		<cfset var sArgs				= StructNew() >
		<cfset var qCount				= "">

		<cfset sArgs.threadID			= arguments.threadID>
		<cfset sArgs.isActive			= 1>
		<cfset sArgs.isCount			= true>
		
		<cfset qCount = getPostGateway().getByAttributesQuery( argumentCollection=sArgs ) /> 
		
		<cfreturn qCount.total />
	</cffunction>


<!---^^CUSTOMEND^^--->
</cfcomponent>











