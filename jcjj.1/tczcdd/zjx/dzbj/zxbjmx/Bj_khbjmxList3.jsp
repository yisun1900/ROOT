<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
</head>

<%
String khbh=request.getParameter("khbh");
String zjxxh=request.getParameter("zjxxh");

if (khbh.equals(""))
{
	return;
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String bgcolor="";
String slstr=null;

int row=0;

String xh=null;
String dqbm=null;
String xmbh=null;
String xmmc=null;
String jldwmc=null;
String jgwzbm=null;
String jgwzmc=null;
String bjjbmc=null;
double zqdj=0;

int fjsl=0;
String[] fjbm=null;
String[] fjmc=null;
double sl=0;
double zjqsl=0;
double zjsl=0;

int allw=433;

try {
	conn=cf.getConnection();

	ls_sql="SELECT count(*)";
	ls_sql+=" FROM bj_fjxxh ";
    ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"'";
	ls_sql+=" order by bj_fjxxh.xuhao ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fjsl=rs.getInt(1);
		fjbm=new String [fjsl];
		fjmc=new String [fjsl];

		allw+=53*fjsl;
	}
	rs.close();
	ps.close();
%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
<noscript><iframe scr="*.htm"></iframe></noscript>
<form method="POST" name="listform" action="" >
<input type="hidden" name="khbh" value="<%=khbh%>" >
<input type="hidden" name="zjxxh" value="<%=zjxxh%>" >

  <DIV onselectstart="return false" style="DISPLAY: inline; OVERFLOW: auto; WIDTH: 100%;HEIGHT: 545px"> 

  <table style="DISPLAY: inline; BORDER-COLLAPSE: collapse" border="1" cellspacing="0" cellpadding="1" width="<%=(allw+30+50)%>" style='FONT-SIZE: 12px'>
    <tr bgcolor="#FFFFFF" style="FONT-WEIGHT: bold; Z-INDEX: 5; POSITION: relative;TOP: expression(this.offsetParent.scrollTop)"> 

      <td colspan="<%=fjsl+6%>" > 
        <table width="100%" border="0">
          <tr> 
            <td width="46%"> 
              <input type=button value='全选' onClick="cf_checkAll(listform)" >
              <input type=button value='删除被选项目' onClick="cf_delete(listform)" >
            </td>
            <td width="54%"> 
              <input type=button value='保存工程量' onClick="cf_submit(listform)" name="sl">
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="reset" value='重输' name="reset" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  <tr bgcolor="#CCCCCC"  align="center" style="FONT-WEIGHT: bold; Z-INDEX: 5; POSITION: relative;TOP: expression(this.offsetParent.scrollTop)"> 
	<td width="10" style="POSITION: relative; BACKGROUND-COLOR: #CC6600">&nbsp;</td>
	<td width="70"style="POSITION: relative; BACKGROUND-COLOR: #CC6600">录入</td>
    <td width="200"style="POSITION: relative; BACKGROUND-COLOR: #CC6600">项目名称</td>
    <td width="50"style="POSITION: relative; BACKGROUND-COLOR: #CC6600">计量单位</td>
    <td width="53"style="POSITION: relative; BACKGROUND-COLOR: #CC6600">标准单价</td>
    <td width="53"style="POSITION: relative; BACKGROUND-COLOR: #CC6600">增减合计</td>
<%
	int i1=0;
	ls_sql="SELECT bj_fjxxh.jgwzbm,xuhao";
	ls_sql+=" FROM bj_fjxxh";
    ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"'";
	ls_sql+=" order by bj_fjxxh.xuhao ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		jgwzbm=rs.getString("xuhao");
		jgwzmc=rs.getString("jgwzbm");
		fjbm[i1]=jgwzbm;
		fjmc[i1]=jgwzmc;
		i1++;
	  %>
    <td width="53" style="POSITION: relative; BACKGROUND-COLOR: #CC6600"><A HREF="#" onclick='winOpen("LrFjGcl3.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>&jgwzbm=<%=jgwzmc%>","900","600","yes","yes");return false;' ><%=jgwzmc%></A></td>
	  <%
	}
	rs.close();
	ps.close();

%>
    </tr>

<%
	ls_sql="SELECT xh,dqbm,xmbh,xmmc,jldwmc,zqdj,bjjbmc";
	ls_sql+=" FROM bj_bjxmmxh,jdm_jldwbm,bdm_bjjbbm  ";
    ls_sql+=" where bj_bjxmmxh.jldwbm=jdm_jldwbm.jldwbm(+) and bj_bjxmmxh.bjjb=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and bj_bjxmmxh.zjxxh='"+zjxxh+"' and bj_bjxmmxh.khbh='"+khbh+"'";
    ls_sql+=" order by bj_bjxmmxh.xmpx,bj_bjxmmxh.xh";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		xh=rs.getString("xh");
		dqbm=rs.getString("dqbm");
		xmbh=rs.getString("xmbh");
		xmmc=rs.getString("xmmc");
		jldwmc=rs.getString("jldwmc");
		bjjbmc=rs.getString("bjjbmc");
		zqdj=rs.getDouble("zqdj");


		if (row%2==0)
		{
			bgcolor="#efe1ff";
		}
		else{
			bgcolor="#FFFFFF";
		}

		sl=0;
		ls_sql="SELECT sum(sl)";
		ls_sql+=" FROM bj_gclmxh ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and dqbm='"+dqbm+"' and xmbh='"+xmbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			sl=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		zjqsl=0;
		ls_sql="SELECT sum(sl)";
		ls_sql+=" FROM bj_gclmxq ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and dqbm='"+dqbm+"' and xmbh='"+xmbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			zjqsl=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		zjsl=sl-zjqsl;
		zjsl=cf.round(zjsl,2);

		if (zjsl==0)
		{
			slstr="";
		}
		else{
			slstr=cf.doubleTrimStr(zjsl,2);
		}

		//输出每行数据
		%> 
    <tr bgcolor="<%=bgcolor%>" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)"> 
      <td width="30" style="FONT-WEIGHT: bold; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"> 
        <input name="xhbox" type="checkbox" value="<%=xh%>">
        <input name="xh" type="hidden" value="<%=xh%>">
      </td>
	<td align="left" width="70" style="FONT-WEIGHT: bold; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
	  <A HREF="#" onclick="winOpen('LrFjGcl4.jsp?zjxxh=<%=zjxxh%>&khbh=<%=khbh%>&dqbm=<%=dqbm%>&xmbh=<%=xmbh%>','900','600','yes','yes');return false;"><%=xmbh.trim()%></A>
	</td>
	<td width="200" style="FONT-WEIGHT: bold; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><%=xmmc%>
	</td>
	<td align="center" width="50"><%=jldwmc%></td>
	  <td align="center" width="53"><%=zqdj%>
	  </td>
	  <td align="right" width="53">
		<input type="text" name="zgcl" size="5" value="<%=slstr%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
	  </td>
      <%
		double gczl=0;

		for (int i=0;i<fjbm.length ;i++ )
		{
			sl=0;
			ls_sql="SELECT sl";
			ls_sql+=" FROM bj_gclmxh ";
			ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and jgwzbm='"+fjmc[i]+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				sl=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			zjqsl=0;
			ls_sql="SELECT sl";
			ls_sql+=" FROM bj_gclmxq ";
			ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and jgwzbm='"+fjmc[i]+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				zjqsl=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			zjsl=sl-zjqsl;
			zjsl=cf.round(zjsl,2);

			gczl+=zjsl;

			if (zjsl==0)
			{
				slstr="";
			}
			else{
				slstr=cf.doubleTrimStr(zjsl,2);
			}

			String zjqslStr=zjqsl+"";
			if (zjqslStr.endsWith(".0"))
			{
				zjqslStr=zjqslStr.substring(0,zjqslStr.length()-2);
			}

			if (i==fjbm.length-1)
			{
				%>
				<td align="center" width="53">
					<input type="text" name="C<%=fjbm[i]%>" size="4" value="<%=slstr%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(C<%=fjbm[0]%>[<%=(row+1)%>])" onchange="f_hzgcl(<%=(row)%>)">
					<input type="hidden" name="CN<%=fjbm[i]%>" value="<%=fjmc[i]%>">
					<input name="CL<%=fjbm[i]%>" type="hidden" value="<%=zjqslStr%>">
				</td>
				<%
			}
			else{
				%>
				<td align="center" width="53">
					<input type="text" name="C<%=fjbm[i]%>" size="4" value="<%=slstr%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(C<%=fjbm[i+1]%>[<%=(row)%>])" onchange="f_hzgcl(<%=(row)%>)">
					<input type="hidden" name="CN<%=fjbm[i]%>" value="<%=fjmc[i]%>">
					<input name="CL<%=fjbm[i]%>" type="hidden" value="<%=zjqslStr%>">
				</td>
				<%
			}
		}

	  %>
  </tr>

	
	<%
		row++;
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%> 
  </table>

  </DIV>

</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--
function onclickTr(obj)
{
	if (obj.style.background=='#ff33ff')
	{
		obj.style.background='#FFFFFF';
	}
	else
	{
		obj.style.background='#FF33FF';
	}
}
function inTr(obj)
{
	if (obj.style.background!='#ff33ff')
	{
		obj.style.background='#FFFF33';
	}
}
function outTr(obj)
{
	if (obj.style.background=='#ffff33')
	{
		obj.style.background='#FFFFFF';
	}
}

parent.guol.editform.zhlr.disabled=false;

function f_hzgcl(row)
{
	var gcl=0.0;
	<%
	for (int i=0;i<fjbm.length ;i++ )
	{
		%>
		if(!(isFloat(listform.C<%=fjbm[i]%>[row], "工程量"))) {
			listform.C<%=fjbm[i]%>[row].select();
			return false;
		}
		var ls=parseFloat(listform.C<%=fjbm[i]%>[row].value)+"";
		if (ls!="NaN")
		{
			gcl=gcl+parseFloat(listform.C<%=fjbm[i]%>[row].value);
		}
//		alert(gcl);
		<%
	}
	%>
	listform.zgcl[row].value=gcl;
} 

var mark=1;
function cf_checkAll(formName)//转换字符串
{
	var i = 0;
	if (<%=row%>==1){
		if (mark==0)
		{
			formName.xhbox.checked =false
		}
		else{
			formName.xhbox.checked =true
		}
	}
	else if (<%=row%> >1){ 
		for (i=0;i< <%=row%>;i++ ){
			if (mark==0)
			{
				formName.xhbox[i].checked =false
			}
			else{
				formName.xhbox[i].checked =true
			}
		}
	}
	if (mark==0)
	{
		mark=1;
	}
	else{
		mark=0;
	}
}
function cf_delete(formName)
{
	var choo=0;
	if ( confirm("注意！删除后不可恢复，确实要删除数据吗?") )	{
		var i = 0;
		if (<%=row%>==1){
			if( formName.xhbox.checked ){
				choo=1;
			}
		} 
		else if (<%=row%>>1){ 
			for (i=0;i< <%=row%>;i++ ){
				if( formName.xhbox[i].checked ){
					choo=1;
				}
			} 
		} 
		if (choo == 0){
			alert("请选择所要操作的数据");
			return false;
		}
		else{
			formName.action="DeleteBj_bjxmmx.jsp";
			formName.submit();
			return true;
		}
	}
} 
function cf_submit(formName)
{
	formName.action="SaveAllBj_bjxmmx.jsp";
	formName.submit();
	return true;
} 
function KeyDown()
{ 

	if ((event.ctrlKey))
	{ //屏蔽 Ctrl+n
		event.returnValue=false;
		alert('禁止拷贝') ;
	}

	if ((event.ctrlKey)&&(event.keyCode==78))
	{ //屏蔽 Ctrl+n
		event.returnValue=false;
	}
	if ((event.shiftKey)&&(event.keyCode==121))
	{ //屏蔽 shift+F10
		event.returnValue=false;
	}
}
//-->
</script>

