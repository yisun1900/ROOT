<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>修改验收</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<%

String lrdw=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
//检查记录号
String gcysbbh=null;
String khbh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
String ssfgs=null;
String sgdmc=null;
String zjxm=null;
String mgbz=null;
String nwgbz=null;
String sdgbz=null;
String yqgbz=null;
String sgd = null;
String hth = null;

String kgrq=null;
String jgrq=null;
int gqts=0;

String fgsmc=null;

String sgddh="";
String zjxmdh="";
String sjsdh="";
String mgbzdh="";
String nwgbzdh="";
String sdgbzdh="";
String yqgbzdh="";

String yqjjsj="";

double wdzgce=0;
double qye=0;

int count=0;
int wwcsl=0;

String yscsjlh=request.getParameter("yscsjlh");
try {
	conn=cf.getConnection();

	ls_sql="select khbh,gcysbbh,yqjjsj ";
	ls_sql+=" from  crm_heysjl ";
	ls_sql+=" where crm_heysjl.yscsjlh='"+yscsjlh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		gcysbbh=cf.fillNull(rs.getString("gcysbbh"));
		yqjjsj=cf.fillNull(rs.getDate("yqjjsj"));
	}
	rs.close();
	ps.close();

	ls_sql="select count(*)";
	ls_sql+=" from  crm_heysjl ";
	ls_sql+=" where yscsjlh ='"+yscsjlh+"'";
	ls_sql+=" and clbz='9'";//9：录入未完成；0：没问题；1: 整改未接收；2：接收；3：已处理；4：已解决；5：验收通过；6：验收未通过
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wwcsl=rs.getInt(1);
	}
	rs.close();
	ps.close();


	ls_sql="select hth,khxm,fwdz,lxfs,sjs,fgsbh,sgdmc,zjxm,mgbz,nwgbz,sdgbz,yqgbz,kgrq,jgrq,gqts,crm_khxx.sgd ";
	ls_sql+=" from  crm_khxx,sq_sgd ";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+)  and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hth=cf.fillNull(rs.getString("hth"));
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		lxfs=rs.getString("lxfs");
		
		sjs=cf.fillNull(rs.getString("sjs"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgd=cf.fillNull(rs.getString("sgd"));

		mgbz=cf.fillNull(rs.getString("mgbz"));
		nwgbz=cf.fillNull(rs.getString("nwgbz"));
		sdgbz=cf.fillNull(rs.getString("sdgbz"));
		yqgbz=cf.fillNull(rs.getString("yqgbz"));
		jgrq=cf.fillNull(rs.getString("jgrq"));
		
		kgrq=cf.fillNull(rs.getDate("kgrq"));

		gqts=rs.getInt("gqts");
	}
	rs.close();
	ps.close();
	
	
	ls_sql="select dwmc ";
	ls_sql+=" from  sq_dwxx ";
	ls_sql+=" where dwbh='"+ssfgs+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fgsmc=cf.fillNull(rs.getString(1));
	}
	rs.close();
	ps.close();

	ls_sql="select dh ";
	ls_sql+=" from  sq_sgd ";
	ls_sql+=" where sgdmc='"+sgdmc+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sgddh=cf.fillNull(rs.getString(1));
	}
	rs.close();
	ps.close();

	ls_sql="select dh ";
	ls_sql+=" from  sq_bzxx ";
	ls_sql+=" where bzmc ='"+mgbz+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mgbzdh=cf.fillNull(rs.getString(1));
	}
	rs.close();
	ps.close();

	ls_sql="select dh ";
	ls_sql+=" from  sq_bzxx ";
	ls_sql+=" where bzmc ='"+nwgbz+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		nwgbzdh=cf.fillNull(rs.getString(1));
	}
	rs.close();
	ps.close();

	ls_sql="select dh ";
	ls_sql+=" from  sq_bzxx ";
	ls_sql+=" where bzmc ='"+sdgbz+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sdgbzdh=cf.fillNull(rs.getString(1));
	}
	rs.close();
	ps.close();

	ls_sql="select dh ";
	ls_sql+=" from  sq_bzxx ";
	ls_sql+=" where bzmc ='"+yqgbz+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yqgbzdh=cf.fillNull(rs.getString(1));
	}
	rs.close();
	ps.close();

	ls_sql="select dh ";
	ls_sql+=" from  sq_bzxx ";
	ls_sql+=" where bzmc ='"+yqgbz+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yqgbzdh=cf.fillNull(rs.getString(1));
	}
	rs.close();
	ps.close();

	ls_sql="select dh ";
	ls_sql+=" from  sq_yhxx ";
	ls_sql+=" where yhmc ='"+sjs+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString(1));
	}
	rs.close();
	ps.close();

	ls_sql="select dh ";
	ls_sql+=" from  sq_yhxx ";
	ls_sql+=" where yhmc ='"+zjxm+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjxmdh=cf.fillNull(rs.getString(1));
	}
	rs.close();
	ps.close();


%>
<style type="text/css">
<!--
.STYLE1 {
	color: #FF0000;
	font-weight: bold;
	font-size: 18px;
}
.STYLE2 {
	color: #FF0000;
	font-weight: bold;
}
-->
</style>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<div align="center">修改验收
<BR>
<span class="STYLE1">(重要提醒：录入完成后必须点按钮【验收录入完成】)</span></div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF"> 
<td  width="15%" align="right">合同号：</td>
<td  width="35%" ><%=hth%></td>
<td  width="15%" align="right" >项目地址：</td>
<td width="35%" ><%=fwdz%></td>
</tr>
<tr bgcolor="#FFFFFF"> 
<td  align="right">客户：</td>
<td  ><%=khxm%></td>
<td  align="right">电话：</td>
<td  ><input name="button" type="button" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')" value="查看电话" ></td>
</tr>
<tr bgcolor="#FFFFFF">
<td  align="right">设计师：</td>
<td  ><%=sjs%></td>
<td  align="right">电话：</td>
<td  ><%=sjsdh%></td>
</tr>
<!-- <tr bgcolor="#FFFFFF"> 
<td colspan="4"  align="left">集团客服中心电话：4008282365
  </td>
</tr> -->
<tr bgcolor="#FFFFFF"> 
<td  align="right">项目总监：</td>
<td  ><%=sgdmc%></td>
<td  align="right">电话：</td>
<td  ><%=sgddh%></td>
</tr>
<tr bgcolor="#FFFFFF">
<td align="right" >品质管理员：</td>
<td  ><%=zjxm%></td>
<td  align="right">电话：</td>
<td  ><%=zjxmdh%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" >整改要求解决时间</td>
  <td colspan="3"  ><input type="text" name="yqjjsj" size="20" maxlength="10" value="<%=yqjjsj%>" onDblClick="JSCalendar(this)">
    <span class="STYLE2">注意：有整改必须录入【要求解决时间】</span></td>
  </tr>
    <tr align="center"> 
      <td colspan="4">
		<input type="hidden" name="yscsjlh" value="<%=yscsjlh%>" >
		<input type="button" name="yswc" onClick="f_do(insertform)"  value="验收录入完成" <%if (wwcsl==0) out.println("disabled");%>>
		<input type="button" name="scwc"  onClick="f_sc(insertform)"  value="删除完成"  <%if (wwcsl!=0) out.println("disabled");%>></td>
    </tr>
</table>


<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF" align="center">
  <td width="8%" ><strong>验收记录号</strong></td>
  <td width="25%"><strong>验收项目</strong></td>
  <td width="6%"><strong>验收结果</strong></td>
  <td width="8%"><strong>整改处理</strong></td>
  <td width="6%"><strong>照片数量</strong></td>
  <td width="54%">&nbsp;</td>
</tr>

<%
	int ysxmsl=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_heysjl ";
	ls_sql+=" where yscsjlh='"+yscsjlh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ysxmsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	String ysjlh=null;
	String gcysxmbm="";
	String gcysxmmc="";
	String xlrmx="";
	String xmlx="";
	String sjysjg="";
	String sjysjgmc="";
	String clbz="";
	String zpml="";
	int zpsl=0;

	int row=0;
	ls_sql="select zpml,ysjlh,gcysxmbm,gcysxmmc,xmlx,xlrmx,zpsl,crm_heysjl.sjysjg,DECODE(crm_heysjl.sjysjg,'0','合格','1','不合格') sjysjgmc,DECODE(crm_heysjl.clbz,'9','录入未完成','0','没问题','1','整改未接收','2','接收','3','已处理','4','已解决','5','验收通过','6','验收未通过') clbz ";
	ls_sql+=" from  crm_heysjl ";
	ls_sql+=" where yscsjlh='"+yscsjlh+"'  ";
	ls_sql+=" order by ysjlh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		zpml=cf.fillNull(rs.getString("zpml"));
		ysjlh=cf.fillNull(rs.getString("ysjlh"));
		gcysxmbm=cf.fillNull(rs.getString("gcysxmbm"));
		gcysxmmc=cf.fillNull(rs.getString("gcysxmmc"));
		xlrmx=cf.fillNull(rs.getString("xlrmx"));//1：不需录入；2：需录入；3：已录入
		xmlx=cf.fillNull(rs.getString("xmlx"));
		sjysjg=cf.fillNull(rs.getString("sjysjg"));//0：合格；1：不合格
		sjysjgmc=cf.fillNull(rs.getString("sjysjgmc"));
		clbz=cf.fillNull(rs.getString("clbz"));
		zpsl=rs.getInt("zpsl");

		row++;

		%>
		<tr bgcolor="#FFFFFF" align="center">
		  <td><%=ysjlh%>
			<input type="hidden" name="ysjlh" value="<%=ysjlh%>" >		  </td>
		  <td><%=gcysxmmc%></td>
		  <td><div id="ysjg<%=row%>"><%=sjysjgmc%></div>
		  </td>
		  <td><%=clbz%></td>
		  <td><%=zpsl%></td>
		  <td align="right">
			<%
			if (xmlx.equals("1")  )//1：验收项；2：状态项
			{
				if (xlrmx.equals("1"))//1：不需录入；2：需录入；3：已录入
				{
					if (sjysjg.equals("0"))//0：合格；1：不合格
					{
						%>
						<input name="lr" type="button" onClick="window.open('SaveBhg.jsp?ysjlh=<%=ysjlh%>&gcysxmbm=<%=gcysxmbm%>');lr[<%=row-1%>].disabled=true;ck[<%=row-1%>].disabled=false;document.getElementById('ysjg<%=row%>').innerHTML='不合格'"  value="不 合 格" >
						<input name="ck" type="button" onClick="window.open('SaveHg.jsp?ysjlh=<%=ysjlh%>&gcysxmbm=<%=gcysxmbm%>');lr[<%=row-1%>].disabled=false;ck[<%=row-1%>].disabled=true;document.getElementById('ysjg<%=row%>').innerHTML='合格'"  value="验收合格" disabled >
						<%
					}
					else{
						%>
						<input name="lr" type="button" onClick="window.open('SaveBhg.jsp?ysjlh=<%=ysjlh%>&gcysxmbm=<%=gcysxmbm%>');lr[<%=row-1%>].disabled=true;ck[<%=row-1%>].disabled=false;document.getElementById('ysjg<%=row%>').innerHTML='不合格'"  value="不 合 格" disabled>
						<input name="ck" type="button" onClick="window.open('SaveHg.jsp?ysjlh=<%=ysjlh%>&gcysxmbm=<%=gcysxmbm%>');lr[<%=row-1%>].disabled=false;ck[<%=row-1%>].disabled=true;document.getElementById('ysjg<%=row%>').innerHTML='合格'"  value="验收合格"  >
						<%
					}
				}
				else if (xlrmx.equals("2"))//1：不需录入；2：需录入；3：已录入
				{
					%>
					<input name="lr" type="button" onClick="f_do1(insertform,'<%=ysjlh%>','<%=gcysxmbm%>');ck[<%=row-1%>].disabled=false"  value="录入项目" >
					<input name="ck" type="button" onClick="f_do2(insertform,'<%=ysjlh%>','<%=gcysxmbm%>')"  value="查看项目" disabled >
					<%
				}
				else if (xlrmx.equals("3"))//1：不需录入；2：需录入；3：已录入
				{
					%>
					<input name="lr" type="button" onClick="f_do1(insertform,'<%=ysjlh%>','<%=gcysxmbm%>');ck[<%=row-1%>].disabled=false"  value="录入项目" disabled>
					<input name="ck" type="button" onClick="f_do2(insertform,'<%=ysjlh%>','<%=gcysxmbm%>')"  value="查看项目" >
					<%
				}
			}
			else{
				%>
				<input name="lr" type="hidden" >
				<input name="ck" type="hidden">
				<%
			}

			%>
			<input type="button" onClick="f_sczp(insertform,'<%=ysjlh%>','<%=gcysxmbm%>','<%=gcysxmmc%>','<%=zpml%>')"  value="上传照片">
			<input type="button" onClick="f_ckzp(insertform,'<%=ysjlh%>')"  value="查看照片">		  
			<input type="button" onClick="f_bz(insertform,'<%=ysjlh%>')"  value="修改备注">		  
		  </td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
%>
</table>
</form>

</body>
<%
}
catch (Exception e) {
	out.println("存盘失败,发生意外: " + e);
	out.println(ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.yqjjsj, "整改要求解决时间"))) {
		return false;
	}

	FormName.action="EndCrm_heysjl.jsp";

	FormName.submit();
	FormName.scwc.disabled=false;
	return true;
}

function f_sc(FormName)//参数FormName:Form的名称
{
	FormName.action="DelEndCrm_heysjl.jsp";

	FormName.submit();
	FormName.yswc.disabled=false;
	return true;
}


function f_sczp(FormName,ysjlh,gcysxmbm,gcysxmmc,zpml)//参数FormName:Form的名称
{
	if(new RegExp('Linux').test(navigator.platform.toString()))
	{
		var urlStr="LoadYsZpPad.jsp?ysjlh="+ysjlh+"&zplx=1&zpxm="+gcysxmbm+"&zpml="+zpml+"&zpsm="+encodeURI(gcysxmmc);
		window.open(urlStr);
	}
	else
	{
		var urlStr="LoadYsZp.jsp?ysjlh="+ysjlh+"&zplx=1&zpxm="+gcysxmbm+"&zpml="+zpml+"&zpsm="+encodeURI(gcysxmmc);
		window.open(urlStr);
	}
}

function f_ckzp(FormName,ysjlh)//参数FormName:Form的名称
{
	var urlStr="ViewZp.jsp?ysjlh="+ysjlh;
	window.open(urlStr);
}



function f_do1(FormName,ysjlh,gcysxmbm)//参数FormName:Form的名称
{
	
	var urlStr="InsertCrm_heysmxb.jsp?ysjlh="+ysjlh+"&khbh=<%=khbh%>&gcysxmbm="+gcysxmbm;
	window.open(urlStr);
}
function f_do2(FormName,ysjlh,gcysxmbm)//参数FormName:Form的名称
{
	var urlStr="EditCrm_heysmxb.jsp?ysjlh="+ysjlh+"&khbh=<%=khbh%>&gcysxmbm="+gcysxmbm;
	window.open(urlStr);
}

function f_bz(FormName,ysjlh)//参数FormName:Form的名称
{
	var urlStr="EditCrm_heysjlBz.jsp?ysjlh="+ysjlh;
	window.open(urlStr);
}
//-->
</SCRIPT>
