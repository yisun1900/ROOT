<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>客户回访-维护</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String hfjgbm=null;
String hfwtbm=null;
String hfr=null;
String hfsj=null;
String hfsm=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String hflxbm=null;
String xchfrq=null;
String xchflxbm=null;


String khxm=null;
String hth=null;
String fwdz=null;
String lxfs=null;
String kgrq=null;
String sjkgrq=null;
String jgrq=null;
String sgbz=null;
String sgd=null;
String sgdmc=null;
String sjs=null;
String zjxm=null;
String bz=null;

String ysgcjdmc=null;
String ybysxmbm=null;
String zqysxmbm=null;
String sybgcrq=null;
String szqsj=null;
String fgsbh=null;
double sfke=0;
String qye=null;
String zkl=null;
String yhyy=null;
String khlxmc=null;
String dwbh=null;
String dwmc=null;
String sjjgrq=null;
String sjwjrq=null;

String sjsdh=null;
String zjdh=null;
String dzdh=null;
String bzdh=null;

String hfjlh=cf.GB2Uni(request.getParameter("hfjlh"));



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


	ls_sql="select khbh,hfjgbm,hfwtbm,hfr,hfsj,hfsm,lrr,lrsj,lrbm,hflxbm,xchfrq,xchflxbm";
	ls_sql+=" from hf_zsghfjl";
	ls_sql+=" where hfjlh='"+hfjlh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		hfjgbm=cf.fillNull(rs.getString("hfjgbm"));
		hfwtbm=cf.fillNull(rs.getString("hfwtbm"));
		hfr=cf.fillNull(rs.getString("hfr"));
		hfsj=cf.fillNull(rs.getDate("hfsj"));
		hfsm=cf.fillNull(rs.getString("hfsm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		hflxbm=cf.fillNull(rs.getString("hflxbm"));
		xchfrq=cf.fillNull(rs.getDate("xchfrq"));
		xchflxbm=cf.fillNull(rs.getString("xchflxbm"));
	}
	rs.close();
	ps.close();

	ls_sql="select fgsbh,ysgcjdmc,sjwjrq,sgbz,khxm,sfke,hth,fwdz,lxfs,kgrq,sjkgrq,jgrq,sgd,sjs,zjxm,qye,zkl,yhyy,khlxmc,sjjgrq,b.dwmc dwmc,crm_khxx.dwbh dwbh,crm_khxx.bz";
	ls_sql+=" ,crm_khxx.ybysxmbm,crm_khxx.zqysxmbm,crm_khxx.sybgcrq,crm_khxx.szqsj";
	ls_sql+=" from  crm_khxx,sq_dwxx b,dm_khlxbm,dm_gcjdbm";
	ls_sql+=" where crm_khxx.dwbh=b.dwbh(+) and crm_khxx.khlxbm=dm_khlxbm.khlxbm(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)  and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ybysxmbm=cf.fillNull(rs.getString("ybysxmbm"));
		zqysxmbm=cf.fillNull(rs.getString("zqysxmbm"));
		sybgcrq=cf.fillNull(rs.getDate("sybgcrq"));
		szqsj=cf.fillNull(rs.getDate("szqsj"));

		fgsbh=rs.getString("fgsbh");
		sfke=rs.getDouble("sfke");
		sgbz=cf.fillHtml(rs.getString("sgbz"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		hth=cf.fillHtml(rs.getString("hth"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		ysgcjdmc=cf.fillHtml(rs.getString("ysgcjdmc"));

		sjwjrq=cf.fillHtml(rs.getDate("sjwjrq"));
		kgrq=cf.fillHtml(rs.getDate("kgrq"));
		sjkgrq=cf.fillHtml(rs.getDate("sjkgrq"));
		jgrq=cf.fillHtml(rs.getDate("jgrq"));

		sgd=cf.fillHtml(rs.getString("sgd"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
        qye=cf.fillHtml(rs.getString("qye"));
		zkl=cf.fillHtml(rs.getString("zkl"));
		yhyy=cf.fillHtml(rs.getString("yhyy"));
		khlxmc=cf.fillHtml(rs.getString("khlxmc"));
	    sjjgrq=cf.fillHtml(rs.getDate("sjjgrq"));
	    dwmc=cf.fillHtml(rs.getString("dwmc"));
	    dwbh=cf.fillHtml(rs.getString("dwbh"));
		bz=cf.fillHtml(rs.getString("bz"));
	}
	rs.close();
	ps.close();


	//设计师电话
	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"' and yhmc ='"+sjs+"' and zwbm='04'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	//工程担当电话
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where ssfgs='"+fgsbh+"' and yhmc ='"+zjxm+"' and zwbm='05'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();


//队长电话
	ls_sql=" select sgdmc,dh from sq_sgd";
	ls_sql+=" where sgd='"+sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		dzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

//班长电话
	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc  ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();


%>


<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
  <div align="center">回访记录－修改</div>

<form method="post" action="SaveEditHf_zsghfjl.jsp" name="insertform" >
  
<table width="100%" border="1" style="FONT-SIZE:12" cellpadding="1" cellspacing="0">
  <tr> 
    <td colspan="2"><font color="#0000CC"><b>客户姓名</b>：</font><%=khxm%>（<%=lxfs%>）</td>
    <td colspan="2"><font color="#0000FF"><b>合同号</b>：</font><%=hth%></td>
    <td width="26%"><font color="#0000CC"><b>客户编号</b>：</font><%=khbh%></td>
    <td width="24%"><font color="#0000FF"><b>关系客户</b>：</font><%=khlxmc%></td>
  </tr>
  <tr> 
    <td colspan="4"><font color="#0000CC"><b>房屋地址</b>：</font><%=fwdz%></td>
    <td width="26%"><font color="#0000FF"><b>签约金额</b>：</font><%=qye%>（<font color="#0000FF">折扣率：</font><%=zkl%>）</td>
    <td width="24%"><font color="#0000FF"><strong>家装实付款</strong>：</font><%=sfke%></td>
  </tr>
  <tr> 
    <td colspan="2"><font color="#0000CC"><b>设计师</b></font>：（<%=dwmc%>）<%=sjs%>（<%=sjsdh%>）</td>
    <td colspan="2"><font color="#0000CC"><b>工程担当</b>：</font><%=zjxm%>（<%=zjdh%>）</td>
    <td width="26%"><font color="#0000CC"><b>施工队</b>：</font><%=sgdmc%>（<%=dzdh%>）</td>
    <td width="24%"><font color="#0000CC"><b>班长</b>：</font><%=sgbz%>（<%=bzdh%>）</td>
  </tr>
  <tr> 
    <td colspan="2"><font color="#0000CC"><b>应开工日期</b>：</font><%=kgrq%></td>
    <td colspan="2"><font color="#0000CC"><b>应竣工日期</b>：</font><%=jgrq%></td>
    <td colspan="2"><font color="#0000FF"><b>优惠内容</b>：</font><%=yhyy%></td>
  </tr>
  <tr> 
    <td colspan="2"><font color="#0000CC"><b>实开工日期</b>：</font><%=sjkgrq%></td>
    <td colspan="2"><font color="#0000CC"><b>实竣工日期</b>：</font><%=sjjgrq%></td>
    <td width="26%"><font color="#0000CC"><b>实际完结日期</b>：</font><%=sjwjrq%></td>
    <td width="24%"><font color="#0000CC"><b>工程进度</b>：</font><%=ysgcjdmc%> </td>
  </tr>
  <tr>
    <td colspan="6"><font color="#0000CC"><b>备注</b>：</font><%=bz%></td>
  </tr>
</table>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
      <tr bgcolor="#FFFFFF">
      <td colspan="4" bgcolor="#E8E8FF">&nbsp;</td>
    </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right" bgcolor="#E8E8FF"><strong><font color="#0000CC">最新验收项目</font></strong></td>
        <td bgcolor="#E8E8FF"><A HREF="/khxx/Crm_gcfxysjlCxList.jsp?khbh=<%=khbh%>" target="_blank">
          <%cf.selectItem(out,"select gcysxmbm,gcysxmmc from dm_gcysxm where gcysxmbm='"+zqysxmbm+"'",zqysxmbm,true);%>
        </A></td>
        <td align="right" bgcolor="#E8E8FF"><strong><font color="#0000CC">最新验收时间</font></strong></td>
        <td bgcolor="#E8E8FF"><%=szqsj%></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right"><font color="#FF0000">*</font>本次回访类型</td>
        <td><select name="select" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm where hflxbm='"+hflxbm+"'",hflxbm);
%>
        </select></td>
        <td width="17%" rowspan="7" align="right">问题部门</td>
        <td width="33%" rowspan="7"><select name="zrbm" style="FONT-SIZE:12PX;WIDTH:252PX" size="13" multiple>
          <option value=""></option>
          <%
	String sql="select sq_tsclbm.dwbh,a.dwmc||'（'||b.dwmc||'）' from sq_tsclbm,sq_dwxx a,sq_dwxx b  where sq_tsclbm.dwbh=a.dwbh and a.ssfgs=b.dwbh and sq_tsclbm.ssfgs='"+fgsbh+"' order by sq_tsclbm.dwbh";
	cf.mutilSelectItem(out,sql,"select zrbm from hf_zsghfwtbm where hfjlh='"+hfjlh+"'");
%>
        </select></td>
      </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#FF0000">*</font>回访结果</td>
      <td width="33%"><select name="hfjgbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
        <option value=""></option>
        <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm order by hfjgbm",hfjgbm);
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">回访问题</td>
      <td><select name="hfwtbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
        <option value=""></option>
        <%
	cf.selectItem(out,"select hfwtbm,hfwtmc from dm_hfwtbm where hflxbm='24' order by hfwtbm",hfwtbm);
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">下次回访类型</td>
      <td><select name="xchflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm where hfdl='2' and sfzdsz='2' order by hflxbm",xchflxbm);
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">下次回访日期</td>
      <td><input type="text" name="xchfrq" value="<%=xchfrq%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0000">*</font><font color="#000099">回访人</font></td>
      <td><input type="text" name="hfr" value="<%=hfr%>" size="20" maxlength="20" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#FF0000">*</font><font color="#000099">回访时间</font></td>
      <td width="33%"><input type="text" name="hfsj" value="<%=hfsj%>" size="20" maxlength="10" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">回访说明</td>
      <td colspan="3"><textarea name="hfsm" cols="71" rows="6"><%=hfsm%></textarea></td>
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
	  <td width="19%"><B>服务人员</B></td>
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

			String bmyyy="";
			ls_sql="select bmyyy";
			ls_sql+=" from  hf_zsghfbmyyy";
			ls_sql+=" where hfjlh='"+hfjlh+"' and hfdxbm='"+hfdxbm+"'";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				bmyyy=cf.fillNull(rs2.getString("bmyyy"));
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
				ls_sql+=" from  hf_zsghfjg";
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

						if (getpfbm.equals(pfbm))
						{
							%>
							<INPUT type="radio" name="dxpjzbbm<%=dxpjzbbm%>" value="<%=pfbm%>" checked><%=pfmc%>
							<%
						}
						else{
							%>
							<INPUT type="radio" name="dxpjzbbm<%=dxpjzbbm%>" value="<%=pfbm%>"><%=pfmc%>
							<%
						}
					}
					rs3.close();
					ps3.close();
%>
				  </td>
				  <td rowspan="<%=sl%>">
					<textarea name="bmyyy<%=hfdxbm%>" cols="52" rows="3"><%=bmyyy%></textarea>
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
				ls_sql+=" from  hf_zsghfjg";
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

						if (getpfbm.equals(pfbm))
						{
							%>
							<INPUT type="radio" name="dxpjzbbm<%=dxpjzbbm%>" value="<%=pfbm%>" checked><%=pfmc%>
							<%
						}
						else{
							%>
							<INPUT type="radio" name="dxpjzbbm<%=dxpjzbbm%>" value="<%=pfbm%>"><%=pfmc%>
							<%
						}
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

		String bcsm="";
		ls_sql="select bcsm";
		ls_sql+=" from  hf_zsgwtbcsm";
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
			<BR>
				<textarea name="wtbh<%=wtbh%>" cols="92" rows="3"><%=bcsm%></textarea>
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
				ls_sql+=" from  hf_zsgwtda";
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
				ls_sql+=" from  hf_zsgwtda";
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
						<input type="checkbox" name="wtbh<%=wtbh%>" value="<%=dabh%>" checked>
						<%=damc%>
						<%
					}
					else{
						%>
						<BR>&nbsp;&nbsp;&nbsp;&nbsp;<%=dabh%>：
						<input type="checkbox" name="wtbh<%=wtbh%>" value="<%=dabh%>">
						<%=damc%>
						<%
					}

					if (sfyxsm.equals("Y"))
					{
						%>
						&nbsp;&nbsp;请说明原因：
						<input type="text" name="w<%=wtbh%>d<%=dabh%>" size="70" maxlength="100" value="<%=dasm%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
						<%
					}
				}
				else if (sfkdx.equals("2"))
				{
					if (count>0)
					{
						%>
						<BR>&nbsp;&nbsp;&nbsp;&nbsp;<%=dabh%>：
						<input type="radio" name="wtbh<%=wtbh%>" value="<%=dabh%>" checked>
						<%=damc%>
						<%
					}
					else{
						%>
						<BR>&nbsp;&nbsp;&nbsp;&nbsp;<%=dabh%>：
						<input type="radio" name="wtbh<%=wtbh%>" value="<%=dabh%>">
						<%=damc%>
						<%
					}

					if (sfyxsm.equals("Y"))
					{
						%>
						&nbsp;&nbsp;请说明原因：
						<input type="text" name="w<%=wtbh%>d<%=dabh%>" size="70" maxlength="100" value="<%=dasm%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
						<%
					}
				}
			}
			rs1.close();
			ps1.close();

			if (sftxsm.equals("Y"))//是否允许填写说明
			{
				bcsm="";
				ls_sql="select bcsm";
				ls_sql+=" from  hf_zsgwtbcsm";
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
				<BR>&nbsp;&nbsp;&nbsp;&nbsp;<%=txsmts%>：
				<input type="text" name="w<%=wtbh%>" size="100" maxlength="200" value="<%=bcsm%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
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
	    <input type="hidden" name="hfjlh" value="<%=hfjlh%>" >
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


<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
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
