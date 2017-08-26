<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>随机回访记录</title>
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
String hflxbm=null;
String xchfrq=null;
String xchflxbm=null;
String hfszjlh=null;


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
String zrbm=cf.GB2Uni(request.getParameter("zrbm"));


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

	ls_sql="select khbh,hf_sjhfjl.hflxbm,hfr,hfsj,hfsm,hfjgmc,hfwtmc,DECODE(wtclzt,'1','未处理','2','在处理','3','已解决') wtclzt,lrr,lrsj,lrbm,hf_sjhfjl.xchfrq,hf_sjhfjl.xchflxbm,hfszjlh";
	ls_sql+=" from hf_sjhfjl,dm_hfjgbm,dm_hfwtbm";
	ls_sql+=" where hf_sjhfjl.hfjgbm=dm_hfjgbm.hfjgbm(+) and hf_sjhfjl.hfwtbm=dm_hfwtbm.hfwtbm(+) ";
	ls_sql+=" and hfjlh='"+hfjlh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		hflxbm=cf.fillNull(rs.getString("hflxbm"));
		hfr=cf.fillNull(rs.getString("hfr"));
		hfsj=cf.fillNull(rs.getDate("hfsj"));
		hfsm=cf.fillNull(rs.getString("hfsm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getString("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		hfjgmc=cf.fillNull(rs.getString("hfjgmc"));
		hfwtmc=cf.fillNull(rs.getString("hfwtmc"));
		wtclzt=cf.fillNull(rs.getString("wtclzt"));
		xchfrq=cf.fillNull(rs.getDate("xchfrq"));
		xchflxbm=cf.fillNull(rs.getString("xchflxbm"));
		hfszjlh=cf.fillNull(rs.getString("hfszjlh"));
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

<form method="post" action="SaveClHf_sjhfjl.jsp" name="insertform">
  
  <div align="center">随机回访问题－处理（回访记录号：<%=hfjlh%>）</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#000099">客户编号</font></td>
      <td><%=khbh%></td>
      <td align="right"><font color="#000099">合同号</font></td>
      <td><%=hth%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#000099">客户姓名</font></td>
      <td><%=khxm%></td>
      <td align="right"><font color="#000099">房屋地址</font></td>
      <td><%=fwdz%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#000099">设计师</font></td>
      <td><%=sjs%></td>
      <td align="right"><font color="#000099">工程担当</font></td>
      <td><%=zjxm%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#000099">施工队</font></td>
      <td><%=sgdmc%></td>
      <td align="right"><font color="#000099">施工班组</font></td>
      <td><%=sgbz%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#000099">签约日期</font></td>
      <td><%=qyrq%></td>
      <td align="right"><font color="#000099">签约店面</font></td>
      <td><%=dwmc%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="4" bgcolor="#E8E8FF">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#CC0000">*</font>是否解决</td>
      <td><%
	cf.radioToken(out, "sfjj","1+未处理&2+在处理&3+已解决","");
%></td>
      <td align="right"><font color="#CC0000">*</font><font color="#0000CC">责任部门</font></td>
      <td><select name="zrbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zrbm+"'","");
%>
        </select></td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#CC0000">*</font>处理情况</td>
      <td colspan="3"><textarea name="clsm" cols="71" rows="4"></textarea>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#CC0000">*</font>处理人</td>
      <td><input type="text" name="clr" size="20" maxlength="20"  value="<%=yhmc%>" >      </td>
      <td align="right"><font color="#CC0000">*</font>处理时间</td>
      <td><input type="text" name="clsj" size="20" maxlength="10"  value="<%=cf.today()%>" onDblClick="JSCalendar(this)"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#CC0000">*</font><font color="#0000FF">录入人</font></td>
      <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="10" readonly>      </td>
      <td align="right"><font color="#CC0000">*</font><font color="#0000CC">录入时间</font></td>
      <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
    </tr>
    <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#CC0000">*</font><font color="#0000CC">录入部门</font></td>
      <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
      </select></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><div align="right">
        备注 </td>
      <td colspan="3" bgcolor="#FFFFFF"><textarea name="bz" cols="71" rows="2" ></textarea>      </td>
    </tr>
    <tr>
      <td colspan="4" align="center">
        <input type="hidden" name="hfjlh"  value="<%=hfjlh%>" >
        <input type="hidden" name="khbh"  value="<%=khbh%>" >
        <input type="button"  value="保存" onClick="f_do(insertform)">
      <input type="reset"  value="重输"></td>
    </tr>
   













<tr bgcolor="#FFFFFF">
      <td align="right"><font color="#000099">本次回访类型</font></td>
      <td>
        <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm where hflxbm='"+hflxbm+"'",hflxbm,true);
%>      </td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
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
      <td align="right" width="17%"><font color="#000099">回访设置记录号</font></td>
      <td width="33%"><%=hfszjlh%></td>
    </tr>
     <tr bgcolor="#FFFFFF">
       <td align="right"><font color="#000099">下次回访类型</font></td>
       <td>
         <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm where hflxbm='"+xchflxbm+"'",xchflxbm,true);
%>       </td>
       <td align="right"><font color="#000099">下次回访日期</font></td>
       <td><%=xchfrq%></td>
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
</form>

<table width="100%" border="1" style="FONT-SIZE:12" cellpadding="0" cellspacing="0">
	<tr align="center" bgcolor="#E8E8FF"> 
	  <td width="12%">责任部门</td>
	  <td width="6%">处理状态</td>
	  <td width="5%">处理人</td>
	  <td width="7%">处理时间</td>
	  <td width="50%">处理说明</td>
	  <td width="5%">录入人</td>
	  <td width="15%">备注</td>
	</tr>
<%
	String zrbmmc=null;
	String sfjj=null;
	String clr=null;
	String clsj=null;
	String clsm=null;
	String getlrr=null;
	String getbz=null;
	ls_sql="select dwmc,DECODE(hf_sjhfcljl.sfjj,'1','未处理','2','在处理','3','已解决') sfjj,hf_sjhfcljl.clr,hf_sjhfcljl.clsj,hf_sjhfcljl.clsm,hf_sjhfcljl.lrr,hf_sjhfcljl.bz";
	ls_sql+=" from hf_sjhfwtbm,hf_sjhfcljl,sq_dwxx";
	ls_sql+=" where hf_sjhfwtbm.hfjlh=hf_sjhfcljl.hfjlh(+) and hf_sjhfwtbm.zrbm=hf_sjhfcljl.zrbm(+)";
	ls_sql+=" and hf_sjhfwtbm.zrbm=sq_dwxx.dwbh(+) ";
	ls_sql+=" and hf_sjhfwtbm.hfjlh='"+hfjlh+"' ";
	ls_sql+=" order by hf_sjhfwtbm.zrbm,hf_sjhfcljl.clsj";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		zrbmmc=cf.fillNull(rs.getString("dwmc"));
		sfjj=cf.fillHtml(rs.getString("sfjj"));
		clr=cf.fillHtml(rs.getString("clr"));
		clsj=cf.fillHtml(rs.getDate("clsj"));
		clsm=cf.fillHtml(rs.getString("clsm"));
		getlrr=cf.fillHtml(rs.getString("lrr"));
		getbz=cf.fillHtml(rs.getString("bz"));

		%>
		<tr align="center"  > 
		  <td><%=zrbmmc%></td>
		  <td><%=sfjj%></td>
		  <td><%=clr%></td>
		  <td><%=clsj%></td>
		  <td align="left"><%=clsm%></td>
		  <td><%=getlrr%></td>
		  <td align="left"><%=getbz%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
%>
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
	  <td width="20%" bgcolor="#E8E8FF"><B>评价内容</B></td>
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
			ls_sql+=" from  hf_sjhfbmyyy";
			ls_sql+=" where hfjlh='"+hfjlh+"' and hfdxbm='"+hfdxbm+"'";
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
				ls_sql+=" from  hf_sjhfjg";
				ls_sql+=" where hfjlh='"+hfjlh+"' and dxpjzbbm='"+dxpjzbbm+"'";
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
				ls_sql+=" from  hf_sjhfjg";
				ls_sql+=" where hfjlh='"+hfjlh+"' and dxpjzbbm='"+dxpjzbbm+"'";
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
		ls_sql+=" from  hf_sjwtbcsm";
		ls_sql+=" where hfjlh='"+hfjlh+"' and wtbh="+wtbh;
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
			ls_sql+=" from  hf_sjwtda";
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
				ls_sql+=" from  hf_sjwtda";
				ls_sql+=" where hfjlh='"+hfjlh+"' and wtbh="+wtbh+" and dabh="+dabh;
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
				ls_sql+=" from  hf_sjwtda";
				ls_sql+=" where hfjlh='"+hfjlh+"' and wtbh="+wtbh+" and dabh="+dabh;
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
				ls_sql+=" from  hf_sjwtbcsm";
				ls_sql+=" where hfjlh='"+hfjlh+"' and wtbh="+wtbh;
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




<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	!radioChecked(FormName.sfjj)) {
		alert("请选择[是否解决]！");
		FormName.sfjj[0].focus();
		return false;
	}

	if(	javaTrim(FormName.clsm)=="") {
		alert("请选择[处理情况]！");
		FormName.clsm.focus();
		return false;
	}
	if(	javaTrim(FormName.clr)=="") {
		alert("请选择[处理人]！");
		FormName.clr.focus();
		return false;
	}
	if(	javaTrim(FormName.clsj)=="") {
		alert("请选择[处理时间]！");
		FormName.clsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.clsj, "处理时间"))) {
		return false;
	}

	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请输入[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
