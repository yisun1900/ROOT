<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>客户回访</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String hfjgbm=null;
String hfr=null;
String hfsj=null;
String hfsm=null;
String bz=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String hfjgmc=null;
String hfwtmc=null;
String wtclzt=null;


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

String hfjlh=cf.GB2Uni(request.getParameter("hfjlh"));

String hflxbm="24";


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

	ls_sql="select khbh,hfr,hfsj,hfsm,hfjgmc,hfwtmc,DECODE(wtclzt,'1','未处理','2','在处理','3','已解决') wtclzt,bz,lrr,lrsj,lrbm";
	ls_sql+=" from crm_wghfjl,dm_hfjgbm,dm_hfwtbm";
	ls_sql+=" where crm_wghfjl.hfjgbm=dm_hfjgbm.hfjgbm(+) and crm_wghfjl.hfwtbm=dm_hfwtbm.hfwtbm(+) ";
	ls_sql+=" and hfjlh='"+hfjlh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		hfr=cf.fillNull(rs.getString("hfr"));
		hfsj=cf.fillNull(rs.getDate("hfsj"));
		hfsm=cf.fillNull(rs.getString("hfsm"));
		bz=cf.fillNull(rs.getString("bz"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getString("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		hfjgmc=cf.fillNull(rs.getString("hfjgmc"));
		hfwtmc=cf.fillNull(rs.getString("hfwtmc"));
		wtclzt=cf.fillNull(rs.getString("wtclzt"));
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,fwdz,lxfs,crm_khxx.dwbh,dwmc,sjs,crm_khxx.sgd,sgdmc,zjxm,hth,sgbz,fgsbh,qyrq";
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
	}
	rs.close();
	ps.close();


%>


<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
  <div align="center">客户回访</div>

  
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
      <td align="right" width="17%"><font color="#000099">回访人</font></td>
      <td width="33%"><%=hfr%></td>
      <td align="right" width="17%"><font color="#000099">回访时间</font></td>
      <td width="33%"><%=hfsj%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="17%"><font color="#000099">回访说明</font></td>
      <td colspan="3"><%=hfsm%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="17%"><font color="#000099">回访结果</font></td>
      <td width="33%"><%=hfjgmc%></td>
      <td align="right" width="17%"><font color="#000099">回访问题</font></td>
      <td width="33%"><%=hfwtmc%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="17%"><font color="#000099">问题处理状态</font></td>
      <td width="33%"><%=wtclzt%></td>
      <td align="right" width="17%">&nbsp;</td>
      <td width="33%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="17%"><font color="#000099">录入人</font></td>
      <td width="33%"><%=lrr%></td>
      <td align="right" width="17%"><font color="#000099">录入时间</font></td>
      <td width="33%"><%=lrsj%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="17%"><font color="#000099">备注</font></td>
      <td colspan="3"><%=bz%></td>
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
	  <td width="22%"><B>服务人员</B></td>
	  <td width="20%"><B>评价内容</B></td>
	  <td width="8%"><B>评分情况</B></td>
	  <td width="50%"><B>不满意的原因</B></td>
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

			String bmyyy="&nbsp;";
			ls_sql="select bmyyy";
			ls_sql+=" from  hf_khhfbmyyy";
			ls_sql+=" where khbh='"+khbh+"' and hflxbm='"+hflxbm+"' and hfdxbm='"+hfdxbm+"'";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				bmyyy=cf.fillHtml(rs2.getString("bmyyy"));
			}
			rs2.close();
			ps2.close();

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

				String getpfbm="";
				ls_sql="select pfbm";
				ls_sql+=" from  hf_khhfjg";
				ls_sql+=" where khbh='"+khbh+"' and hflxbm='"+hflxbm+"' and dxpjzbbm='"+dxpjzbbm+"'";
				ps3= conn.prepareStatement(ls_sql);
				rs3 =ps3.executeQuery();
				if (rs3.next())
				{
					getpfbm=cf.fillNull(rs3.getString("pfbm"));
				}
				rs3.close();
				ps3.close();

				%>
				<tr align="center" bgcolor="<%=bgcolor%>"> 
				  <td rowspan="<%=sl%>">
					<%=hfdxmc%>
				  </td>
				  <td>
					<%=dxpjzb%>
				  </td>
				  <td>
<%
					String pfmc="&nbsp;";
					ls_sql="select pfmc";
					ls_sql+=" from  hdm_pjzbpf";
					ls_sql+=" where dxpjzbbm='"+dxpjzbbm+"' and pfbm='"+getpfbm+"'";
					ps3= conn.prepareStatement(ls_sql);
					rs3 =ps3.executeQuery();
					if (rs3.next())
					{
						pfmc=cf.fillNull(rs3.getString("pfmc"));

					}
					rs3.close();
					ps3.close();
%>
					<%=pfmc%>
				  </td>
				  <td rowspan="<%=sl%>" align="left"><%=bmyyy%>
				  </td>
				</tr>
				<%

			}

			while (rs2.next())
			{
				dxpjzbbm=cf.fillNull(rs2.getString("dxpjzbbm"));
				dxpjzb=cf.fillNull(rs2.getString("dxpjzb"));

				String getpfbm="";
				ls_sql="select pfbm";
				ls_sql+=" from  hf_khhfjg";
				ls_sql+=" where khbh='"+khbh+"' and hflxbm='"+hflxbm+"' and dxpjzbbm='"+dxpjzbbm+"'";
				ps3= conn.prepareStatement(ls_sql);
				rs3 =ps3.executeQuery();
				if (rs3.next())
				{
					getpfbm=cf.fillNull(rs3.getString("pfbm"));
				}
				rs3.close();
				ps3.close();

				%>
				<tr align="center" bgcolor="<%=bgcolor%>"> 
				  <td>
					<%=dxpjzb%>
				  </td>
				  <td>
<%
					String pfmc="&nbsp;";
					ls_sql="select pfmc";
					ls_sql+=" from  hdm_pjzbpf";
					ls_sql+=" where dxpjzbbm='"+dxpjzbbm+"' and pfbm='"+getpfbm+"'";
					ps3= conn.prepareStatement(ls_sql);
					rs3 =ps3.executeQuery();
					if (rs3.next())
					{
						pfmc=cf.fillNull(rs3.getString("pfmc"));

					}
					rs3.close();
					ps3.close();
%>
					<%=pfmc%>
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

		String bcsm="";
		ls_sql="select bcsm";
		ls_sql+=" from  hf_wtbcsm";
		ls_sql+=" where khbh='"+khbh+"' and wtbh="+wtbh;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			bcsm=cf.fillNull(rs1.getString("bcsm"));
		}
		rs1.close();
		ps1.close();

		%>
		<P><B><%=wtbh%>：<%=wtmc%></B>
		<%


		if (sfkdx.equals("3"))//1：多选；2：单选；3：写说明
		{
			%>
			<BR>&nbsp;&nbsp;&nbsp;&nbsp;<%=bcsm%>
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
				
				int count=0;
				ls_sql="select count(*)";
				ls_sql+=" from  hf_khwtda";
				ls_sql+=" where khbh='"+khbh+"' and wtbh="+wtbh+" and dabh="+dabh;
				ps2= conn.prepareStatement(ls_sql);
				rs2 =ps2.executeQuery();
				if (rs2.next())
				{
					count=rs2.getInt(1);
				}
				rs2.close();
				ps2.close();
				
				String dasm="";
				ls_sql="select dasm";
				ls_sql+=" from  hf_khwtda";
				ls_sql+=" where khbh='"+khbh+"' and wtbh="+wtbh+" and dabh="+dabh;
				ps2= conn.prepareStatement(ls_sql);
				rs2 =ps2.executeQuery();
				if (rs2.next())
				{
					dasm=cf.fillNull(rs2.getString("dasm"));
				}
				rs2.close();
				ps2.close();

				if (sfkdx.equals("1"))//1：多选；2：单选；3：写说明
				{
					if (count>0)
					{
						%>
						<BR>&nbsp;&nbsp;&nbsp;&nbsp;<%=dabh%>：
						<%=damc%>
						<%

						if (sfyxsm.equals("Y"))
						{
							%>
							&nbsp;&nbsp;请说明原因：<%=dasm%>
							<%
						}
					}

				}
				else if (sfkdx.equals("2"))
				{
					if (count>0)
					{
						%>
						<BR>&nbsp;&nbsp;&nbsp;&nbsp;<%=dabh%>：
						<%=damc%>
						<%

						if (sfyxsm.equals("Y"))
						{
							%>
							&nbsp;&nbsp;请说明原因：<%=dasm%>
							<%
						}
					}

				}
			}
			rs1.close();
			ps1.close();

			if (sftxsm.equals("Y"))//是否允许填写说明
			{
				bcsm="";
				ls_sql="select bcsm";
				ls_sql+=" from  hf_wtbcsm";
				ls_sql+=" where khbh='"+khbh+"' and wtbh="+wtbh;
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					bcsm=cf.fillNull(rs1.getString("bcsm"));
				}
				rs1.close();
				ps1.close();

				%>
				<BR>&nbsp;&nbsp;&nbsp;&nbsp;<%=txsmts%>：<%=bcsm%>
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


