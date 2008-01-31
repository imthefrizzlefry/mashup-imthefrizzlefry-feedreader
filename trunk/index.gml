<gm:page title="Sample - Feed Reader" authenticate="true">   
   
  <!--
    The feed reader application demonstrates the JS API's list function
    setData(). Users can create a feed of their favorite blogs and then
    dynamically set the data set of a list control to display the
    different blog entries.
    @author:GME Team
  -->

  <style>
   .gm-pager-button {     
     background:#C3D9FF;
     border:medium none;
     color:#112ABB;
     cursor:pointer;
     padding:2px;
     text-decoration:underline;
    }      
  </style>

  <script>
    function changeData(entry) {
      if (entry) {
        var urlGPath = new GPath("atom:link[@rel='alternate']/@href");
        var urlString = urlGPath.getValue(entry);
        google.mashups.getObjectById('blogEntryList').setData(urlString);
      }
      else {
        google.mashups.getObjectById('blogEntryList').setData(null);
      }
    }
  </script>

  <div class="gm-app-header">
    <h1>Feed Reader</h1>
  </div>
   
  <div id="blogForm">
    <gm:item data="${user}/blogs" create="true" template="myItemTemplate"/>
  </div>
 
  <table style="width:80%">
    <tr valign="top">
      <td style="padding-right:10px; width:250px" valign="top">
        <gm:list id="blogList" data="${user}/blogs" template="blogListTemplate">
          <gm:handleEvent event="select" execute="changeData(event.entry);"/>
        </gm:list>
      </td>
      <td valign="top">
        <gm:list id="blogEntryList" pagesize="5" template="blog"/>
      </td>
    </tr>
  </table>
  
  <gm:template id="blogListTemplate">
    <table class="blue-theme" style="width:250px">
      <thead>
        <th>Blog</th>
        <th/>
      </thead>
      <tr repeat="true">
        <td><gm:text ref="atom:title"/></td>
        <td style="width:40px"><gm:editButtons deleteonly="true"/></td>
      </tr>
      <tfoot>
        <tr>
          <td colspan="2"/>
        </tr>
      </tfoot>
    </table>
  </gm:template>

  <gm:template id="myItemTemplate">
    <table style="margin-bottom:15px; width:400px" align="center">
      <tbody repeat="true">
        <tr><td align='center"><b>Blog title:</b></td></tr>
        <tr><td align="center"><gm:text ref="atom:title"/></td></tr>
        <tr><td align='center"><b>Blog URL:</b></td></tr>
        <tr><td align="center"><gm:text ref="atom:link[@rel='alternate']/@href"/></td></tr>
        <tr><td align="center"><gm:editButtons text="true"/></td></tr>
      </tbody>
    </table>
  </gm:template>

</gm:page>
