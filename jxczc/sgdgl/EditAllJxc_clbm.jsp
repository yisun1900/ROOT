<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
</head>
<%
String sgph=request.getParameter("sgph");
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));


String xsfsmc=null;
String xsfs=null;
String clbm=null;
String nbbm=null;
String clmc=null;
String xh=null;
String gg=null;
String ppmc=null;
String fgsdj=null;
double sgjg=0;
double sgsl=0;
String cldlmc=null;
String jldwbm=null;

String bgcolor="";

int row=0;

String fgsbh=null;
String hth=null;
String khxm=null;
String fwdz=null;
String sgdmc=null;
double qye=0;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

%>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">修改材料单明细(材料单号:<%=sgph%>)</font></B>
</CENTER>
<form method="POST" name="listform" action="">

<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="10%">小类</td>
	<td  width="8%">内部编码</td>
	<td  width="18%">材料名称</td>
	<td  width="12%">规格</td>
	<td  width="7%">计量单位</td>
	<td  width="7%">材料单价</td>
	<td  width="7%">包装规格</td>
	<td  width="7%">最小起订量</td>
	<td  width="7%">库存数量</td>
	<td  width="8%">数量</td>
	<td  width="17%">子品牌</td>
</tr>
<%
	String clxlbm=null;
	ls_sql="SELECT distinct clxlbm ";
	ls_sql+=" FROM jxc_clsgmx  ";
    ls_sql+=" where sgph='"+sgph+"'";
    ls_sql+=" order by clxlbm";
	ps2= conn.prepareStatement(ls_sql);
	rs2 =ps2.executeQuery();
	while (rs2.next())
	{
		clxlbm=cf.fillNull(rs2.getString("clxlbm"));

		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM jxc_clsgmx ";
		ls_sql+=" where jxc_clsgmx.sgph='"+sgph+"' and jxc_clsgmx.clxlbm='"+clxlbm+"' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();


	
		ls_sql="SELECT jxc_clsgmx.sgph,jxc_clsgmx.clbm,jxc_clsgmx.nbbm,jxc_clsgmx.clmc,jxc_clsgmx.xh,jxc_clsgmx.gg,jxc_clsgmx.ppmc,jxc_clsgmx.jldwbm,jxc_clsgmx.sgjg,jxc_clsgmx.sgsl";
		ls_sql+=" FROM jxc_clsgmx,jxc_clbm ";
		ls_sql+=" where jxc_clsgmx.clbm=jxc_clbm.clbm and jxc_clsgmx.sgph='"+sgph+"' and jxc_clbm.clxlbm='"+clxlbm+"' ";
		ls_sql+=" order by jxc_clsgmx.sgxh ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			row++;

			clbm=cf.fillNull(rs.getString("clbm"));
			nbbm=cf.fillHtml(rs.getString("nbbm"));
			clmc=cf.fillHtml(rs.getString("clmc"));
			xh=cf.fillHtml(rs.getString("xh"));
			gg=cf.fillHtml(rs.getString("gg"));
			ppmc=cf.fillHtml(rs.getString("ppmc"));
			jldwbm=cf.fillHtml(rs.getString("jldwbm"));
			sgjg=rs.getDouble("sgjg");
			sgsl=rs.getDouble("sgsl");


			double zxqdl=0;
			double bzgg=0;
			double zcpzsl=0;
			double ccpzsl=0;
			double bfpzsl=0;
			double dhsl=0;
			double ycgsl=0;
			double kdhsl=0;//可订货数

			ls_sql="select zxqdl,bzgg,zcpzsl,ccpzsl,bfpzsl,dhsl,zcpzsl-dhsl kdhsl,ycgsl ";
			ls_sql+=" from  jxc_cljgb,jxc_clbm";
			ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm and jxc_cljgb.clbm='"+clbm+"' and  jxc_cljgb.dqbm='"+dqbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zxqdl=rs1.getDouble("zxqdl");
				bzgg=rs1.getDouble("bzgg");
				zcpzsl=rs1.getDouble("zcpzsl");
				ccpzsl=rs1.getDouble("ccpzsl");
				bfpzsl=rs1.getDouble("bfpzsl");
				dhsl=rs1.getDouble("dhsl");
				kdhsl=rs1.getDouble("kdhsl");
				ycgsl=rs1.getDouble("ycgsl");
			}
			rs1.close();
			ps1.close();

			
			if (row%2==0)
			{
				bgcolor="E8E8FF";
			}
			else{
				bgcolor="FFFFFF";
			}
	%>
			<tr bgcolor="<%=bgcolor%>" align="center">
			<td align="center">
				<input name="chitem" type="checkbox" value="<%=clbm%>">
				<input type="hidden" name="clbm" value="<%=clbm%>">
			</td>
			<td rowspan="<%=count%>"><%=clxlbm%></td>
			<td><%=nbbm%></td>
			<td><%=clmc%></td>
			<td><%=gg%></td>
			<td><%=jldwbm%></td>
			<td><%=sgjg%>
				<input type="hidden" name="sgjg" value="<%=sgjg%>">
			</td>
			<td><%=bzgg%>
				<input type="hidden" name="bzgg" value="<%=bzgg%>">
			</td>
			<td><%=zxqdl%>
				<input type="hidden" name="zxqdl" value="<%=zxqdl%>">
			</td>
			<td><%=zcpzsl%></td>
			<td> 
				<input type="text" name="sgsl" size="8" maxlength="10" value=<%=sgsl%> style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
			<td><%=ppmc%></td>
			</tr>
	<%
		}

	
		while (rs.next())
		{
			row++;

			clbm=cf.fillNull(rs.getString("clbm"));
			nbbm=cf.fillHtml(rs.getString("nbbm"));
			clmc=cf.fillHtml(rs.getString("clmc"));
			xh=cf.fillHtml(rs.getString("xh"));
			gg=cf.fillHtml(rs.getString("gg"));
			ppmc=cf.fillHtml(rs.getString("ppmc"));
			jldwbm=cf.fillHtml(rs.getString("jldwbm"));
			sgjg=rs.getDouble("sgjg");
			sgsl=rs.getDouble("sgsl");


			double zxqdl=0;
			double bzgg=0;
			double zcpzsl=0;
			double ccpzsl=0;
			double bfpzsl=0;
			double dhsl=0;
			double ycgsl=0;
			double kdhsl=0;//可订货数

			ls_sql="select zxqdl,bzgg,zcpzsl,ccpzsl,bfpzsl,dhsl,zcpzsl-dhsl kdhsl,ycgsl ";
			ls_sql+=" from  jxc_cljgb,jxc_clbm";
			ls_sql+=" where jxc_cljgb.clbm=jxc_clbm.clbm and jxc_cljgb.clbm='"+clbm+"' and  jxc_cljgb.dqbm='"+dqbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				zxqdl=rs1.getDouble("zxqdl");
				bzgg=rs1.getDouble("bzgg");
				zcpzsl=rs1.getDouble("zcpzsl");
				ccpzsl=rs1.getDouble("ccpzsl");
				bfpzsl=rs1.getDouble("bfpzsl");
				dhsl=rs1.getDouble("dhsl");
				kdhsl=rs1.getDouble("kdhsl");
				ycgsl=rs1.getDouble("ycgsl");
			}
			rs1.close();
			ps1.close();

			
			if (row%2==0)
			{
				bgcolor="E8E8FF";
			}
			else{
				bgcolor="FFFFFF";
			}
	%>
			<tr bgcolor="<%=bgcolor%>" align="center">
			<td align="center">
				<input name="chitem" type="checkbox" value="<%=clbm%>">
				<input type="hidden" name="clbm" value="<%=clbm%>">
			</td>
			<td><%=nbbm%></td>
			<td><%=clmc%></td>
			<td><%=gg%></td>
			<td><%=jldwbm%></td>
			<td><%=sgjg%>
				<input type="hidden" name="sgjg" value="<%=sgjg%>">
			</td>
			<td><%=bzgg%>
				<input type="hidden" name="bzgg" value="<%=bzgg%>">
			</td>
			<td><%=zxqdl%>
				<input type="hidden" name="zxqdl" value="<%=zxqdl%>">
			</td>
			<td><%=zcpzsl%></td>
			<td> 
				<input type="text" name="sgsl" size="8" maxlength="10" value=<%=sgsl%> style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" >
			</td>
			<td><%=ppmc%></td>
			</tr>
	<%
		}
		rs.close();
		ps.close();
	
	
	}
	rs2.close();
	ps2.close();
}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<tr bgcolor="#FFFFFF"> 
      <td colspan="13" > 
		<input type="hidden" name="dqbm" value="<%=dqbm%>">
		<input type="hidden" name="sgph" value="<%=sgph%>">
		<input type=button value=' 存 盘 ' onClick="f_do(listform)" name="sl">
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="reset" value='重输' name="reset" >      
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type=button value='全选删除项' onclick="selectAll(listform)">
		&nbsp;&nbsp;
		<input type=button value='删除被选项' onClick="f_delete(listform)">
		&nbsp;&nbsp;
	  </td>
    </tr>
</table>
</form>
</body>

</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--

function f_do(FormName)
{
	if (<%=row%><=1)
	{
		if(	javaTrim(FormName.sgsl)=="") {
			alert("请输入[开单数量]！");
			FormName.sgsl.select();
			return false;
		}
		if(!(isFloat(FormName.sgsl, "开单数量"))) {
			return false;
		}

		if (parseFloat(FormName.sgsl.value)<=0)
		{
			alert("【开单数量】必须大于零！！！");
			FormName.sgsl.select();
			return false;
		}
		if (parseFloat(FormName.sgsl.value) < parseFloat(FormName.zxqdl.value))
		{
			alert("【开单数量】必须大于【最小起订量"+FormName.zxqdl.value+"】！！！");
			FormName.sgsl.select();
			return false;
		}

		if (parseFloat(FormName.sgsl.value) % parseFloat(FormName.bzgg.value) !=0)
		{
			alert("【数量】必须是【包装规格"+FormName.bzgg.value+"】的整数倍！！！");
			FormName.sgsl.select();
			return false;
		}

	}
	else//如果只有一条记录不能通过数组的形式访问
	{
		for (i=0;i<<%=row%> ;i++ )
		{
			if(	javaTrim(FormName.sgsl[i])=="") {
				alert("请输入[开单数量]！");
				FormName.sgsl[i].select();
				return false;
			}
			if(!(isFloat(FormName.sgsl[i], "开单数量"))) {
				return false;
			}

			if (parseFloat(FormName.sgsl[i].value)<=0)
			{
				alert("【开单数量】必须大于零！！！");
				FormName.sgsl[i].select();
				return false;
			}
			if (parseFloat(FormName.sgsl[i].value) < parseFloat(FormName.zxqdl[i].value))
			{
				alert("【开单数量】必须大于【最小起订量"+FormName.zxqdl[i].value+"】！！！");
				FormName.sgsl[i].select();
				return false;
			}
			if (parseFloat(FormName.sgsl[i].value) % parseFloat(FormName.bzgg[i].value) !=0)
			{
				alert("【数量】必须是【包装规格"+FormName.bzgg[i].value+"】的整数倍！！！");
				FormName.sgsl[i].select();
				return false;
			}

		}
	}

	FormName.action="SaveEditAllJxc_clbm.jsp";
	FormName.submit();
	return true;
} 

var mark=1;
function selectAll(FormName)//转换字符串
{
	var i = 0;
	if (<%=row%>==1)
	{
		if (mark==0)
		{
			FormName.chitem.checked =false
		}
		else{
			FormName.chitem.checked =true
		}
	}
	else
	{ 
		for (i=0;i <<%=row%> ;i++ )
		{
			if (mark==0)
			{
				FormName.chitem[i].checked =false
			}
			else{
				FormName.chitem[i].checked =true
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

function f_delete(FormName)
{
	if (!confirm("确实要删除吗？") )	
	{
		return false;
	}

	var choo=0;
	var i = 0;
	if (<%=row%>==1)
	{
		if( FormName.chitem.checked )
		{
			choo=1;
		}
	} 
	else
	{ 
		for (i=0;i <<%=row%> ;i++ )
		{
			if( FormName.chitem[i].checked )
			{
				choo=1;
			}
		} 
	} 
	if (choo == 0)
	{
		alert("请选择所要删除的项目");
		return false;
	}

	FormName.action="DeleteJxc_clbm.jsp";
	FormName.submit();
	return true;

}

//-->
</script>

