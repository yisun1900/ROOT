<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入柜体板件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<%
	String gtxh=cf.GB2Uni(request.getParameter("gtxh"));
	String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
%>

<body bgcolor="#FFFFFF" style='FONT-SIZE: 16px'>
<form method="post" action="" name="insertform" target="_blank">
<div align="center">录入柜体板件（订单编号：<%=ddbh%>，柜体序号：<%=gtxh%>）</div>
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center"> 
	<td  width="4%"><b><font color="#0000FF">复制板件</font></b></td>
	<td  width="4%">序号</td>
	<td  width="13%">板材类型</td>
	<td  width="9%">板件名称</td>
	<td  width="6%">板材厚度(mm)</td>
	<td  width="7%">长(mm)</td>
	<td  width="7%">宽(mm)</td>
	<td  width="7%">数量</td>
	<td  width="7%"><font color="#0000FF">单价</font></td>
	<td  width="9%"><font color="#0000FF">金额</font></td>
	<td  width="20%">备注</td>
	  <td  width="4%"><font color="#0000FF"><b>删除板件</b></font></td>
	</tr>
<%
long bjxh=0;
String bjmc=null;
String bcpp=null;
String bchd=null;
double bzdj=0;
double khdj=0;
int cd=0;
int kd=0;
int sl=0;
double zqje=0;
double je=0;
String bz=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String bgcolor=null;

int rownum=0;

String gtbcpp=null;
String bclx=null;
String dwstr=null;

try {
	conn=cf.getConnection();

	ls_sql="select bcpp,bclx";
	ls_sql+=" from  jc_jjgtmx";
	ls_sql+=" where gtxh='"+gtxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gtbcpp=rs.getString("bcpp");
		bclx=rs.getString("bclx");
	}
	rs.close();
	ps.close();

	dwstr=cf.getItemData(conn,"select bchd c1,bchd c2,bclx from jc_jjbjbj where bcpp='"+gtbcpp+"' order by bclx,bchd");

	int row=0;

	ls_sql="SELECT bjxh,ddbh,bjmc,bcpp,bchd,bzdj,khdj,cd,kd,sl,je,zqje,bz  ";
	ls_sql+=" FROM jc_gtbjmx  ";
    ls_sql+=" where gtxh='"+gtxh+"' and ddbh='"+ddbh+"'";
    ls_sql+=" order by pxxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		rownum++;
		if (rownum>500)
		{
			out.println("错误！结果不能大于500行");
			return;
		}

		bjxh=rs.getLong("bjxh");
		bjmc=rs.getString("bjmc");
		bcpp=rs.getString("bcpp");
		bchd=rs.getString("bchd");
		bzdj=rs.getDouble("bzdj");
		khdj=rs.getDouble("khdj");
		cd=rs.getInt("cd");
		kd=rs.getInt("kd");
		sl=rs.getInt("sl");
		je=rs.getDouble("je");
		zqje=rs.getDouble("zqje");
		bz=cf.fillNull(rs.getString("bz"));

		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%>
		<tr bgcolor="<%=bgcolor%>"  align="center"> 
			<td> 
				<input type="radio" name="copy" value="copy"  onclick="f_copy(insertform,<%=row%>)">
			</td>
			<td><%=(row+1)%>
				<input type="hidden" name="bjxh"  value="<%=bjxh%>" >
			</td>
			<td>
				<select name="bcpp" style="FONT-SIZE:12PX;WIDTH:120PX" onChange="bzdj[<%=row%>].value='';selectItem(bcpp[<%=row%>],bchd[<%=row%>],<%=dwstr%>);">
				  <option value=""></option>
				  <%
					cf.selectItem(out,"select distinct bclx c1,bclx c2 from jc_jjbjbj where bcpp='"+gtbcpp+"' order by bclx",bcpp);
				  %> 
				</select>
			</td>
			<td>
				<select name="bjmc" style="FONT-SIZE:12PX;WIDTH:70PX">
				  <option value=""></option>
				  <%
					cf.selectItem(out,"select bjmc c1,bjmc c2 from jdm_gtbjmc order by bjmc",bjmc);
				  %> 
				</select>
			</td>
			<td>
				<select name="bchd" style="FONT-SIZE:12PX;WIDTH:42PX" onChange="getDj(insertform,<%=row%>)">
				  <option value=""></option>
				  <%
					cf.selectItem(out,"select bchd c1,bchd c2,bclx from jc_jjbjbj where bclx='"+bcpp+"' order by bclx,bchd",bchd);
				  %> 
				</select>
			</td>
			<td>
				<input type="text" name="cd" value="<%=cd%>" size="6" maxlength="8" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(kd[<%=row%>])" onChange="f_wdzje(insertform,<%=row%>)">
			</td>
			<td>
				<input type="text" name="kd" value="<%=kd%>" size="6" maxlength="8" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(sl[<%=row%>])" onChange="f_wdzje(insertform,<%=row%>)">
			</td>
			<td>
				<input type="text" name="sl" value="<%=sl%>" size="6" maxlength="8" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(cd[<%=(row+1)%>])" onChange="f_wdzje(insertform,<%=row%>)">
			</td>
			<td>
				<input type="text" name="bzdj" value="<%=bzdj%>" size="6" maxlength="8" readonly style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(kd[<%=row%>])" onChange="f_wdzje(insertform,<%=row%>)">
			</td>
			<td>
				<input type="text" name="je" value="<%=zqje%>" size="10" maxlength="13" readonly style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(kd[<%=row%>])">
			</td>
			<td>
				<input type="text" name="bz" value="<%=bz%>" size="26" maxlength="200" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(kd[<%=row%>])">
			</td>
			<td> 
				<input type="radio" name="delete" value="delete" onclick="f_delete(insertform,<%=row%>)">
			</td>
		</tr>
		<%

		row++;
	}
	rs.close();
	ps.close();

	for (;row<19 ;row++ )
	{
		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}
		%>
		<tr bgcolor="<%=bgcolor%>"  align="center"> 
			<td> 
				<input type="radio" name="copy" value="copy"  onclick="f_copy(insertform,<%=row%>)">
			</td>
			<td><%=(row+1)%>
				<input type="hidden" name="bjxh"  value="" >
			</td>
			<td>
				<select name="bcpp" style="FONT-SIZE:12PX;WIDTH:120PX"  onChange="bzdj[<%=row%>].value='';selectItem(bcpp[<%=row%>],bchd[<%=row%>],<%=dwstr%>);">
				  <option value=""></option>
				  <%
					cf.selectItem(out,"select distinct bclx c1,bclx c2 from jc_jjbjbj where bcpp='"+gtbcpp+"' order by bclx",bclx);
				  %> 
				</select>
			</td>
			<td>
				<select name="bjmc" style="FONT-SIZE:12PX;WIDTH:70PX">
				  <option value=""></option>
				  <%
					cf.selectItem(out,"select bjmc c1,bjmc c2 from jdm_gtbjmc order by bjmc","");
				  %> 
				</select>
			</td>
			<td>
				<select name="bchd" style="FONT-SIZE:12PX;WIDTH:42PX" onChange="getDj(insertform,<%=row%>)">
				  <option value=""></option>
				  <%
					cf.selectItem(out,"select bchd c1,bchd c2,bclx from jc_jjbjbj where bclx='"+bclx+"' order by bclx,bchd","");
				  %> 
				</select>
			</td>
			<td>
				<input type="text" name="cd" value="" size="6" maxlength="8" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(kd[<%=row%>])" onChange="f_wdzje(insertform,<%=row%>)">
			</td>
			<td>
				<input type="text" name="kd" value="" size="6" maxlength="8" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(sl[<%=row%>])" onChange="f_wdzje(insertform,<%=row%>)">
			</td>
			<td>
				<input type="text" name="sl" value="" size="6" maxlength="8" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(cd[<%=(row+1)%>])" onChange="f_wdzje(insertform,<%=row%>)">
			</td>
			<td>
				<input type="text" name="bzdj" value="" size="6" maxlength="8" readonly style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(kd[<%=row%>])" onChange="f_wdzje(insertform,<%=row%>)">
			</td>
			<td>
				<input type="text" name="je" value="" size="10" maxlength="13" readonly style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(kd[<%=row%>])">
			</td>
			<td>
				<input type="text" name="bz" value="" size="26" maxlength="200" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(kd[<%=row%>])">
			</td>
			<td> 
				<input type="radio" name="delete" value="delete" onclick="f_delete(insertform,<%=row%>)">
			</td>
		</tr>
		<%
	}
	

%>
<tr> 
  <td colspan="13" > 
	<div align="center"> 
		<input type="hidden" name="gtxh" value="<%=gtxh%>" >
		<input type="hidden" name="ddbh" value="<%=ddbh%>" >
		<input type="button"  value="保存" onClick="f_do(insertform)" name="savebutton">
		<input type="button"  value="允许存盘" onClick="savebutton.disabled=false">
	</div>
  </td>
</tr>
</table>
</form>

</body>
</html>


<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function getDj(FormName,row)
{
	if(	javaTrim(FormName.bcpp[row])=="") {
		return false;
	}
	if(	javaTrim(FormName.bchd[row])=="") {
		return false;
	}
	if(!(isNumber(FormName.bchd[row], "板材厚度"))) {
		return false;
	}

	FormName.bzdj[row].value="";
	FormName.je[row].value="";

	var str="Jc_gtbjmxCx.jsp?row="+row+"&bcpp="+escape(escape(FormName.bcpp[row].value))+"&bchd="+FormName.bchd[row].value;
//	alert(str);
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function f_wdzje(FormName,row)//参数FormName:Form的名称
{
	var je=0;
	je=(FormName.cd[row].value/1000.0*FormName.kd[row].value/1000.0)*FormName.bzdj[row].value*FormName.sl[row].value;
	je=round(je,2);
	FormName.je[row].value=je;
}

function f_do(FormName)//参数FormName:Form的名称
{
	FormName.action="SaveInsertJc_gtbjmx.jsp";
	FormName.submit();
	FormName.savebutton.disabled=true;
	return true;
}

function f_copy(FormName,row)//参数FormName:Form的名称
{
	if ( confirm("注意！复制后只有点击『保存』按钮，才能真正完成复制") )	
	{
		//删除中间空行+++++++++++
		var jsrow=0;
		var mark=1;
		for (var i=0;i<19 ;i++ )
		{
			if (javaTrim(FormName.bjmc[i])!="")
			{
				if (mark==0)//中间有空行，删除空行
				{
					FormName.bcpp[jsrow].value=FormName.bcpp[i].value;
					FormName.bjxh[jsrow].value=FormName.bjxh[i].value;
					FormName.bjmc[jsrow].value=FormName.bjmc[i].value;
					FormName.bchd[jsrow].value=FormName.bchd[i].value;
					FormName.cd[jsrow].value=FormName.cd[i].value;
					FormName.kd[jsrow].value=FormName.kd[i].value;
					FormName.sl[jsrow].value=FormName.sl[i].value;
					FormName.bzdj[jsrow].value=FormName.bzdj[i].value;
					FormName.je[jsrow].value=FormName.je[i].value;
					FormName.bz[jsrow].value=FormName.bz[i].value;


					FormName.bcpp[i].value="<%=bclx%>";//缺省值
					FormName.bjxh[i].value="";
					FormName.bjmc[i].value="";
					FormName.bchd[i].value="";
					FormName.cd[i].value="";
					FormName.kd[i].value="";
					FormName.sl[i].value="";
					FormName.bzdj[i].value="";
					FormName.je[i].value="";
					FormName.bz[i].value="";
				}
				jsrow+=1;
			}
			else{
				mark=0;
			}
		}
		//删除中间空行完成------------


		//复制开始+++++++++++
		//首先下移一行＋＋＋＋＋＋＋＋＋＋＋＋＋
		for (var i=18;i>(row+1) ;i-- )
		{
			FormName.bcpp[i].value=FormName.bcpp[i-1].value;
			FormName.bjxh[i].value=FormName.bjxh[i-1].value;
			FormName.bjmc[i].value=FormName.bjmc[i-1].value;
			FormName.bchd[i].value=FormName.bchd[i-1].value;
			FormName.cd[i].value=FormName.cd[i-1].value;
			FormName.kd[i].value=FormName.kd[i-1].value;
			FormName.sl[i].value=FormName.sl[i-1].value;
			FormName.bzdj[i].value=FormName.bzdj[i-1].value;
			FormName.je[i].value=FormName.je[i-1].value;
			FormName.bz[i].value=FormName.bz[i-1].value;


			FormName.bcpp[i-1].value="<%=bclx%>";
			FormName.bjxh[i-1].value="";
			FormName.bjmc[i-1].value="";
			FormName.bchd[i-1].value="";
			FormName.cd[i-1].value="";
			FormName.kd[i-1].value="";
			FormName.sl[i-1].value="";
			FormName.bzdj[i-1].value="";
			FormName.je[i-1].value="";
			FormName.bz[i-1].value="";
		}
		//首先下移一行完成－－－－－－－－－－－－－－－－

		//复制
		FormName.bcpp[row+1].value=FormName.bcpp[row].value;
		FormName.bjxh[row+1].value="";
		FormName.bjmc[row+1].value=FormName.bjmc[row].value;
		FormName.bchd[row+1].value=FormName.bchd[row].value;
		FormName.cd[row+1].value=FormName.cd[row].value;
		FormName.kd[row+1].value=FormName.kd[row].value;
		FormName.sl[row+1].value=FormName.sl[row].value;
		FormName.bzdj[row+1].value=FormName.bzdj[row].value;
		FormName.je[row+1].value=FormName.je[row].value;
		FormName.bz[row+1].value=FormName.bz[row].value;
		//复制完成------------
	}
} 

function f_delete(FormName,row)//参数FormName:Form的名称
{
	if ( confirm("注意！删除后只有点击『保存』按钮，才能真正删除") )	
	{
		//清空[row]行
		FormName.bcpp[row].value="<%=bclx%>";
		FormName.bjxh[row].value="";
		FormName.bjmc[row].value="";
		FormName.bchd[row].value="";
		FormName.cd[row].value="";
		FormName.kd[row].value="";
		FormName.sl[row].value="";
		FormName.bzdj[row].value="";
		FormName.je[row].value="";
		FormName.bz[row].value="";

		//删除中间空行+++++++++++
		var jsrow=0;
		var mark=1;
		for (var i=0;i<19 ;i++ )
		{
			if (javaTrim(FormName.bjmc[i])!="")
			{
				if (mark==0)//中间有空行，删除空行
				{
					FormName.bcpp[jsrow].value=FormName.bcpp[i].value;
					FormName.bjxh[jsrow].value=FormName.bjxh[i].value;
					FormName.bjmc[jsrow].value=FormName.bjmc[i].value;
					FormName.bchd[jsrow].value=FormName.bchd[i].value;
					FormName.cd[jsrow].value=FormName.cd[i].value;
					FormName.kd[jsrow].value=FormName.kd[i].value;
					FormName.sl[jsrow].value=FormName.sl[i].value;
					FormName.bzdj[jsrow].value=FormName.bzdj[i].value;
					FormName.je[jsrow].value=FormName.je[i].value;
					FormName.bz[jsrow].value=FormName.bz[i].value;


					FormName.bcpp[i].value="<%=bclx%>";
					FormName.bjxh[i].value="";
					FormName.bjmc[i].value="";
					FormName.bchd[i].value="";
					FormName.cd[i].value="";
					FormName.kd[i].value="";
					FormName.sl[i].value="";
					FormName.bzdj[i].value="";
					FormName.je[i].value="";
					FormName.bz[i].value="";
				}
				jsrow+=1;
			}
			else{
				mark=0;
			}
		}
		//删除中间空行完成------------
	}
} 

//-->
</SCRIPT>


