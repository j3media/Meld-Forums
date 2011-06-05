﻿<cfsilent>
	<cfset local.rc = rc>
</cfsilent>
<cfoutput>
	<div id="msTabs-General">
		<h3>#local.rc.mmRBF.key('general')#</h3>
		<ul class="form">
			<li class="first">
				<label for="forumbean_name">#local.rc.mmRBF.key('forumname')#</label>
				<input class="text" type="text" name="forumbean_name" id="forumbean_name" value="#form.forumbean_name#" size="30" maxlength="100" required="true" validate="string" message="#local.rc.mmRBF.key('forumname','validation')#" />
			</li>
			<li>
				<label for="forumbean_title">#local.rc.mmRBF.key('forumtitle')#<a href="##" class="tooltip"><span>#local.rc.mmRBF.key('forumtitle','tip')#</span>&nbsp;</a></label>
				<input class="text" type="text" name="forumbean_title" id="forumbean_title" value="#form.forumbean_title#" size="30" maxlength="100" required="true" validate="string" message="#local.rc.mmRBF.key('forumtitle','validation')#" />
			</li>
			<li>
				<label for="forumbean_name">#local.rc.mmRBF.key('friendlyname')#<a href="##" class="tooltip"><span>#local.rc.mmRBF.key('friendlyname','tip')#</span>&nbsp;</a> <span class="doShowHide" onclick="doClickShowHide('friendlyShowHide',false,'forumbean_friendlyname')">#local.rc.mmRBF.key('show')#</span></label>
				<div id="friendlyShowHide" style="display: none">
				<input class="text" type="text" name="forumbean_friendlyname" id="forumbean_friendlyname" value="#form.forumbean_friendlyname#" size="30" maxlength="100" />
				</div>
			</li>
			<li class="first">
				<label for="forumbean_conferenceid">#local.rc.mmRBF.key('conference')#<a href="##" class="tooltip"><span>#local.rc.mmRBF.key('conference','tip')#</span>&nbsp;</a></label>
				<select class="select" name="forumbean_conferenceid" id="forumbean_conferenceid">
					<cfloop from="1" to="#arrayLen(local.rc.aConferences)#" index="local.iiX">
						<option value="#rc.aConferences[local.iiX].getConferenceID()#"<cfif len(rc.conferenceID) and rc.aConferences[local.iiX].getConferenceID() eq rc.conferenceID>SELECTED</cfif>>#rc.aConferences[local.iiX].getName()#</option>
					</cfloop>
				</select>
			</li>
			<li>
			<label for="forumbean_description">#local.rc.mmRBF.key('forumdescription')#: </label>
			<textarea name="forumbean_description" id="forumbean_description"><cfif len(form.forumbean_description)>#HTMLEditFormat(form.forumbean_description)#<cfelse><br /></cfif></textarea>
			<script type="text/javascript" language="Javascript">
			var loadEditorCount = 0;
			jQuery('##forumbean_description').ckeditor(
				{ 
				toolbar :
		        [
		            ['Source','-','Cut','Copy','Paste','PasteText','PasteWord','-','Bold','Italic','-','Image','-','OrderedList','UnorderedList','-','Link','Unlink','-','FitWindow','ShowBlocks','-','Style','-','About']
		        ],
				height:'200',
				customConfig : 'config.js.cfm' },htmlEditorOnComplete);
			</script>
			</li>
		</ul>
	</div>
</cfoutput>