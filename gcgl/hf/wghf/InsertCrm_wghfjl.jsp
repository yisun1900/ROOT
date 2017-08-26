<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");

String hth=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
String zjxm=null;
String sgd=null;
String sgdmc=null;
String sgbz=null;
String dwbh=null;
String dwmc=null;
String fgsbh=null;
String qyrq=null;
String xmjfzt=null;

String hfjlh=null;
String khbh=cf.GB2Uni(request.getParameter("khbh"));

String hflxbm="24";//11：定期回访；12：上门回访；13：随机回访;21：材料进场回访；22：隐蔽工程回访；23：中期回访；24：完工回访；25：例行回访；26：随机回访；31：完工后关怀回访;41：投诉报修回访

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
PreparedStatement ps3=null;
ResultSet rs3=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql="select khxm,fwdz,lxfs,crm_khxx.dwbh,dwmc,sjs,crm_khxx.sgd,sgdmc,zjxm,hth,sgbz,fgsbh,qyrq,xmjfzt";
	ls_sql+=" from  crm_khxx,sq_dwxx,sq_sgd";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		xmjfzt=cf.fillNull(rs.getString("xmjfzt"));
	}
	rs.close();
	ps.close();


	if (xmjfzt.equals("Y"))
	{
		out.println("错误！已做完工回访");
		return;
	}

	//回访记录号
	int count=0;
	ls_sql="select NVL(max(substr(hfjlh,8,3)),0)";
	ls_sql+=" from  crm_wghfjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	
	hfjlh=khbh+cf.addZero(count+1,3);
%>


<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
  <div align="center">客户回访（回访记录号：<%=hfjlh%>） </div>

<form method="post" action="SaveInsertCrm_wghfjl.jsp" name="insertform">
  
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">回访记录号</td>
	<td  width="6%">回访结果</td>
	<td  width="16%">回访问题</td>
	<td  width="5%">状态</td>
	<td  width="5%">回访人</td>
	<td  width="7%">回访时间</td>
	<td  width="54%">回访说明</td>
</tr>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	
	ls_sql="SELECT crm_wghfjl.hfjlh,hfjgmc,hfwtmc,DECODE(crm_wghfjl.wtclzt,'1','未处理','2','在处理','3','已解决'),crm_wghfjl.hfr,crm_wghfjl.hfsj,crm_wghfjl.hfsm ";
	ls_sql+=" FROM crm_wghfjl,dm_hfjgbm,dm_hfwtbm  ";
    ls_sql+=" where crm_wghfjl.hfjgbm=dm_hfjgbm.hfjgbm(+)";
    ls_sql+=" and crm_wghfjl.hfwtbm=dm_hfwtbm.hfwtbm(+)";
    ls_sql+=" and crm_wghfjl.khbh='"+khbh+"'";
    ls_sql+=" order by lrsj ";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();

%>
</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#000099">客户编号</font></td>
      <td width="33%"><%=khbh%></td>
      <td align="right" width="17%"><font color="#000099">合同号</font></td>
      <td width="33%"><%=hth%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#000099">客户姓名</font></td>
      <td width="33%"><%=khxm%></td>
      <td align="right" width="17%"><font color="#000099">房屋地址</font></td>
      <td width="33%"><%=fwdz%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#000099">设计师</font></td>
      <td width="33%"><%=sjs%></td>
      <td align="right" width="17%"><font color="#000099">工程担当</font></td>
      <td width="33%"><%=zjxm%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#000099">施工队</font></td>
      <td width="33%"><%=sgdmc%></td>
      <td align="right" width="17%"><font color="#000099">施工班组</font></td>
      <td width="33%"><%=sgbz%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#000099">签约日期</font></td>
      <td width="33%"><%=qyrq%></td>
      <td align="right" width="17%"><font color="#000099">签约店面</font></td>
      <td width="33%"><%=dwmc%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="4" bgcolor="#E8E8FF">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#FF0000">*</font>回访结果</td>
      <td width="33%"><select name="hfjgbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
        <option value=""></option>
        <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm order by hfjgbm","");
%>
      </select></td>
      <td width="17%" rowspan="4" align="right">问题部门</td>
      <td width="33%" rowspan="4">
	<select name="zrbm" style="FONT-SIZE:12PX;WIDTH:252PX" size="9" multiple>
        <option value=""></option>
        <%
	String sql="select sq_tsclbm.dwbh,a.dwmc||'（'||b.dwmc||'）' from sq_tsclbm,sq_dwxx a,sq_dwxx b  where sq_tsclbm.dwbh=a.dwbh and a.ssfgs=b.dwbh and sq_tsclbm.ssfgs='"+fgsbh+"' order by sq_tsclbm.dwbh";
	cf.selectItem(out,sql,"");
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">回访问题</td>
      <td><select name="hfwtbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
        <option value=""></option>
        <%
	cf.selectItem(out,"select hfwtbm,hfwtmc from dm_hfwtbm where hflxbm='24' order by hfwtbm","");
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font><font color="#000099">回访人</font></td>
      <td><input type="text" name="hfr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#FF0000">*</font><font color="#000099">回访时间</font></td>
      <td width="33%"><input type="text" name="hfsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">回访说明</td>
      <td colspan="3"><textarea name="hfsm" cols="71" rows="6"></textarea></td>
    </tr>
  </table>

<%
	String bgcolor="#FFFFFF";
	
	
	//回访对象分类编码
	String hfdxflbm=null;
	String hfdxflmc=null;
	ls_sql="select distinct hdm_hfdxflbm.hfdxflbm,hdm_hfdxflbm.hfdxflmc";
	ls_sql+=" from  hdm_hfxxsz,hdm_dxpjzb,hdm_hfdxbm,hdm_hfdxflbm";
	ls_sql+=" where hdm_hfxxsz.dxpjzbbm=hdm_dxpjzb.dxpjzbbm and hdm_dxpjzb.hfdxbm=hdm_hfdxbm.hfdxbm ";
	ls_sql+=" and hdm_hfdxbm.hfdxflbm=hdm_hfdxflbm.hfdxflbm";
	ls_sql+=" and hdm_hfxxsz.hflxbm='"+hflxbm+"' ";
	ls_sql+=" order by hdm_hfdxflbm.hfdxflbm ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		hfdxflbm=cf.fillNull(rs.getString("hfdxflbm"));
		hfdxflmc=cf.fillNull(rs.getString("hfdxflmc"));


		%> 
  <BR><B><%=hfdxflmc%></B>
  <table width="100%" border="1" style="FONT-SIZE:14" cellpadding="0" cellspacing="0">
	<tr align="center" bgcolor="#E8E8FF"> 
	  <td width="19%" bgcolor="#E8E8FF"><B>服务人员</B></td>
	  <td width="16%"><B>评价内容</B></td>
	  <td width="25%"><B>评分情况</B></td>
	  <td width="40%"><B>不满意的原因</B></td>
	</tr>
      <%
		//回访对象编码
		int row=0;
		String hfdxbm=null;
		String hfdxmc=null;
		ls_sql="select distinct  hdm_hfdxbm.hfdxbm,hdm_hfdxbm.hfdxmc,hdm_hfdxbm.xh";
		ls_sql+=" from  hdm_hfxxsz,hdm_dxpjzb,hdm_hfdxbm";
		ls_sql+=" where hdm_hfxxsz.dxpjzbbm=hdm_dxpjzb.dxpjzbbm and hdm_dxpjzb.hfdxbm=hdm_hfdxbm.hfdxbm ";
		ls_sql+="  and hdm_hfdxbm.hfdxflbm='"+hfdxflbm+"' and hdm_hfxxsz.hflxbm='"+hflxbm+"' ";
		ls_sql+=" order by hdm_hfdxbm.xh ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			hfdxbm=cf.fillNull(rs1.getString("hfdxbm"));
			hfdxmc=cf.fillNull(rs1.getString("hfdxmc"));

			row++;
			if (row%2==1)
			{
				bgcolor="#FFFFFF";
			}
			else{
				bgcolor="#E8E8FF";
			}

			int sl=0;
			ls_sql="select count(*)";
			ls_sql+=" from  hdm_dxpjzb,hdm_hfxxsz";
			ls_sql+=" where hdm_dxpjzb.dxpjzbbm=hdm_hfxxsz.dxpjzbbm and hdm_dxpjzb.hfdxbm='"+hfdxbm+"' and hdm_hfxxsz.hflxbm='"+hflxbm+"'";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				sl=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();


			//回访对象评价指标
			String dxpjzbbm=null;
			String dxpjzb=null;
			ls_sql="select hdm_dxpjzb.dxpjzbbm,hdm_dxpjzb.dxpjzb";
			ls_sql+=" from  hdm_dxpjzb,hdm_hfxxsz";
			ls_sql+=" where hdm_dxpjzb.dxpjzbbm=hdm_hfxxsz.dxpjzbbm and hdm_dxpjzb.hfdxbm='"+hfdxbm+"' and hdm_hfxxsz.hflxbm='"+hflxbm+"'";
			ls_sql+=" order by hdm_dxpjzb.xh ";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				dxpjzbbm=cf.fillNull(rs2.getString("dxpjzbbm"));
				dxpjzb=cf.fillNull(rs2.getString("dxpjzb"));

				%>
				<tr align="center" bgcolor="<%=bgcolor%>"> 
				  <td rowspan="<%=sl%>">
					<%=hfdxmc%>
					<input type="hidden" name="hfdxbm"  value="<%=hfdxbm%>" >
				  </td>
				  <td>
					<%=dxpjzb%>
					<input type="hidden" name="dxpjzbbm"  value="<%=dxpjzbbm%>" >
				  </td>
				  <td>
<%
					String pfbm=null;
					String pfmc=null;
					ls_sql="select pfbm,pfmc";
					ls_sql+=" from  hdm_pjzbpf";
					ls_sql+=" where dxpjzbbm='"+dxpjzbbm+"'";
					ls_sql+=" order by xh ";
					ps3= conn.prepareStatement(ls_sql);
					rs3 =ps3.executeQuery();
					while (rs3.next())
					{
						pfbm=cf.fillNull(rs3.getString("pfbm"));
						pfmc=cf.fillNull(rs3.getString("pfmc"));

						%>
						<INPUT type="radio" name="dxpjzbbm<%=dxpjzbbm%>" value="<%=pfbm%>"><%=pfmc%>
						<%
					}
					rs3.close();
					ps3.close();
%>
				  </td>
				  <td rowspan="<%=sl%>">
					<textarea name="bmyyy<%=hfdxbm%>" cols="52" rows="3"></textarea>
				  </td>
				</tr>
				<%

			}

			while (rs2.next())
			{
				dxpjzbbm=cf.fillNull(rs2.getString("dxpjzbbm"));
				dxpjzb=cf.fillNull(rs2.getString("dxpjzb"));

				%>
				<tr align="center" bgcolor="<%=bgcolor%>"> 
				  <td>
					<%=dxpjzb%>
					<input type="hidden" name="dxpjzbbm"  value="<%=dxpjzbbm%>" >
				  </td>
				  <td>
<%
					String pfbm=null;
					String pfmc=null;
					ls_sql="select pfbm,pfmc";
					ls_sql+=" from  hdm_pjzbpf";
					ls_sql+=" where dxpjzbbm='"+dxpjzbbm+"'";
					ls_sql+=" order by xh ";
					ps3= conn.prepareStatement(ls_sql);
					rs3 =ps3.executeQuery();
					while (rs3.next())
					{
						pfbm=cf.fillNull(rs3.getString("pfbm"));
						pfmc=cf.fillNull(rs3.getString("pfmc"));

						%>
						<INPUT type="radio" name="dxpjzbbm<%=dxpjzbbm%>" value="<%=pfbm%>"><%=pfmc%>
						<%
					}
					rs3.close();
					ps3.close();
%>
				  </td>
				</tr>
				<%

			}
			rs2.close();
			ps2.close();

		
		}
		rs1.close();
		ps1.close();

		%> 
  </table>
    <%

	
	
	}
	rs.close();
	ps.close();
	
%> 
  </table>

  <P>
  <table width="100%" border="0" style="FONT-SIZE:12" cellpadding="2" cellspacing="2">
	<tr bgcolor="#FFFFFF"> 
	  <td width="2%">&nbsp</td>
	  <td>
<%
	String wtbh=null;
	String wtmc=null;
	String sfkdx=null;
	String yxbz=null;
	String fbsj=null;
	String sftxsm=null;
	String txsmts=null;
	ls_sql="select hdm_hfwt.wtbh,wtmc,sfkdx,yxbz,fbsj,sftxsm,txsmts ";
	ls_sql+=" from  hdm_hfwt,hdm_hfwtsz";
	ls_sql+=" where  hdm_hfwt.wtbh=hdm_hfwtsz.wtbh and hdm_hfwt.yxbz='Y' and hdm_hfwtsz.hflxbm='"+hflxbm+"'";
	ls_sql+=" order by wtbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		wtbh=cf.fillNull(rs.getString("wtbh"));
		wtmc=cf.fillNull(rs.getString("wtmc"));
		sfkdx=cf.fillNull(rs.getString("sfkdx"));//是否可多选 ,1：多选；2：单选；3：写说明
		yxbz=cf.fillNull(rs.getString("yxbz"));
		fbsj=cf.fillNull(rs.getDate("fbsj"));
		sftxsm=cf.fillNull(rs.getString("sftxsm"));//Y：允许；N：不允许
		txsmts=cf.fillNull(rs.getString("txsmts"));

		%>
		<P><B><%=wtbh%>：<%=wtmc%></B>
		<%


		if (sfkdx.equals("3"))//1：多选；2：单选；3：写说明
		{
			%>
			<BR>
				<textarea name="wtbh<%=wtbh%>" cols="92" rows="3"></textarea>
			<%
		}
		else{
			String dabh=null;
			String damc=null;
			String sfyxsm=null;
			ls_sql="select dabh,damc,sfyxsm";
			ls_sql+=" from  hdm_hfwtda";
			ls_sql+=" where  wtbh="+wtbh;
			ls_sql+=" order by dabh";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			while (rs1.next())
			{
				dabh=cf.fillNull(rs1.getString("dabh"));
				damc=cf.fillNull(rs1.getString("damc"));
				sfyxsm=cf.fillNull(rs1.getString("sfyxsm"));//Y：允许；N：不允许
				
				if (sfkdx.equals("1"))//1：多选；2：单选；3：写说明
				{
					%>
					<BR>&nbsp;&nbsp;&nbsp;&nbsp;<%=dabh%>：
					<input type="checkbox" name="wtbh<%=wtbh%>" value="<%=dabh%>">
					<%=damc%>
					<%

					if (sfyxsm.equals("Y"))
					{
						%>
						&nbsp;&nbsp;请说明原因：
						<input type="text" name="w<%=wtbh%>d<%=dabh%>" size="70" maxlength="100" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
						<%
					}
				}
				else if (sfkdx.equals("2"))
				{
					%>
					<BR>&nbsp;&nbsp;&nbsp;&nbsp;<%=dabh%>：
					<input type="radio" name="wtbh<%=wtbh%>" value="<%=dabh%>">
					<%=damc%>
					<%
					if (sfyxsm.equals("Y"))
					{
						%>
						&nbsp;&nbsp;请说明原因：
						<input type="text" name="w<%=wtbh%>d<%=dabh%>" size="70" maxlength="100" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
						<%
					}
				}
			}
			rs1.close();
			ps1.close();

			if (sftxsm.equals("Y"))//是否允许填写说明
			{
				%>
				<BR>&nbsp;&nbsp;&nbsp;&nbsp;<%=txsmts%>：
				<input type="text" name="w<%=wtbh%>" size="100" maxlength="200" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
				<%
			}
		}

	}
	rs.close();
	ps.close();
%>
  
	</td>
	</tr>
  </table>

  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr align="center"> 
      <td colspan="14"> 
        <input type="hidden" name="hfjlh"  value="<%=hfjlh%>" >
        <input type="hidden" name="khbh"  value="<%=khbh%>" >
        <input type="hidden" name="hflxbm"  value="<%=hflxbm%>" >
        <input type="button"  value="存盘" onClick="f_do(insertform)">
        <input type="reset"  value="重输" name="reset">
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
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2 != null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (rs3 != null) rs3.close(); 
		if (ps3!= null) ps3.close(); 
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
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.hfjgbm)=="") {
		alert("请输入[回访结果]！");
		FormName.hfjgbm.focus();
		return false;
	}
	if (FormName.hfjgbm.value=="02")
	{
		if(	javaTrim(FormName.hfwtbm)=="") {
			alert("请输入[回访问题]！");
			FormName.hfwtbm.focus();
			return false;
		}
		if(	javaTrim(FormName.hfsm)=="") {
			alert("请输入[回访说明]！");
			FormName.hfsm.focus();
			return false;
		}

		if (!selectChecked(FormName.zrbm)){
			alert("请选择[问题部门]！");
			FormName.zrbm.focus();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.hfwtbm)!="") {
			alert("不需要输入[回访问题]！");
			FormName.hfwtbm.focus();
			return false;
		}
	}

	if(	javaTrim(FormName.hfr)=="") {
		alert("请输入[回访人]！");
		FormName.hfr.focus();
		return false;
	}
	if(	javaTrim(FormName.hfsj)=="") {
		alert("请输入[回访时间]！");
		FormName.hfsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.hfsj, "回访时间"))) {
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
