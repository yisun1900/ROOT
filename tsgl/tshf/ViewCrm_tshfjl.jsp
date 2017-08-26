<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String hfjlh=cf.GB2Uni(request.getParameter("hfjlh"));

String khbh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String qtdh=null;
String email=null;

String dwbh=null;
String dwmc=null;
String zjxm=null;
String sgd=null;
String sgdmc=null;
String sjs=null;
String hth=null;
String sgbz=null;
String sjkgrq=null;
String sjjgrq=null;
String ssfgs=null;

String djbh=null;
String hfdjbz=null;
String djyy=null;
String djsj=null;
String djr=null;
String jhjdsj=null;

String gcjdbm=null;
String zt=null;

String kbxbz=null;
String bxkssj=null;
String bxjzsj=null;
String bybxsm=null;
int syts=0;


String khhfqk=null;
String cxxwt=null;
String hfr=null;
String hfsj=null;
String hfbm=null;
String clfs=null;
String xchfrq=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String wheresql="";
int count=0;
try {
	conn=cf.getConnection();

	ls_sql="select khbh,khhfqk,cxxwt,hfsj,hfr,hfbm,clfs,xchfrq ";
	ls_sql+=" from  crm_tshfjl ";
	ls_sql+=" where hfjlh='"+hfjlh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		khhfqk=cf.fillNull(rs.getString("khhfqk"));
		cxxwt=cf.fillNull(rs.getString("cxxwt"));
		hfsj=cf.fillNull(rs.getDate("hfsj"));
		hfr=cf.fillNull(rs.getString("hfr"));
		hfbm=cf.fillNull(rs.getString("hfbm"));
		clfs=cf.fillNull(rs.getString("clfs"));
		xchfrq=cf.fillNull(rs.getDate("xchfrq"));
	}
	rs.close();
	ps.close();

	ls_sql="select zt,gcjdbm,kbxbz,bxkssj,bxjzsj,bybxsm,bxjzsj-SYSDATE syts,khxm,fwdz,lxfs,qtdh,crm_khxx.email,crm_khxx.dwbh,dwmc,sjs,crm_khxx.sgd,sgdmc,zjxm,hth,sjkgrq,sjjgrq,djbh,hfdjbz,djyy,djsj,djr,jhjdsj,sgbz,fgsbh";
	ls_sql+=" from  crm_khxx,sq_dwxx,sq_sgd";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zt=cf.fillNull(rs.getString("zt"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));

		kbxbz=cf.fillNull(rs.getString("kbxbz"));
		bxkssj=cf.fillNull(rs.getDate("bxkssj"));
		bxjzsj=cf.fillNull(rs.getDate("bxjzsj"));
		bybxsm=cf.fillNull(rs.getString("bybxsm"));
		syts=rs.getInt("syts");

		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		qtdh=cf.fillNull(rs.getString("qtdh"));
		email=cf.fillNull(rs.getString("email"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));

		djbh=cf.fillNull(rs.getString("djbh"));
		hfdjbz=cf.fillNull(rs.getString("hfdjbz"));
		djyy=cf.fillNull(rs.getString("djyy"));
		djsj=cf.fillNull(rs.getDate("djsj"));
		djr=cf.fillNull(rs.getString("djr"));
		jhjdsj=cf.fillNull(rs.getDate("jhjdsj"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
	}
	rs.close();
	ps.close();


%>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:12">
  <tr>
    <td width="100%"> 
      <div align="center">客户投诉报修回访（回访记录号：<%=hfjlh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#E8E8FF"> 
            <td width="25%" align="left"> <font color="#0000CC">客户编号：</font><%=khbh%> 
            </td>
            <td width="25%"><font color="#0000CC">合同号：</font><%=hth%> </td>
            <td width="25%"> <font color="#0000CC">客户姓名：</font><%=khxm%></td>
            <td width="25%"><font color="#0000CC">质检员：</font><%=zjxm%> </td>
          </tr>
          <tr bgcolor="#E8E8FF"> 
            <td colspan="2" align="left"><font color="#0000CC">手机：</font><%=lxfs%></td>
            <td colspan="2"><font color="#0000CC">其它电话：</font><%=qtdh%></td>
          </tr>
          <tr bgcolor="#E8E8FF"> 
            <td colspan="2" align="left"><font color="#0000CC">房屋地址：</font><%=fwdz%> 
            </td>
            <td width="25%"><font color="#0000CC">实开工日期：</font><%=sjkgrq%> </td>
            <td width="25%"><font color="#0000CC">实交工日期：</font><%=sjjgrq%> </td>
          </tr>
          <tr bgcolor="#E8E8FF"> 
            <td width="25%" align="left"><font color="#0000CC">签约店面：</font><%=dwmc%> 
            </td>
            <td width="25%"><font color="#0000CC">设计师：</font><%=sjs%> </td>
            <td width="25%"> <font color="#0000CC">施工队：</font><%=sgdmc%> </td>
            <td width="25%"><font color="#0000CC">施工班组：</font><%=sgbz%> </td>
          </tr>
          <tr bgcolor="#CCFFCC"> 
            <td width="25%" align="left"><font color="#0000CC">回访冻结标志：</font><%
	cf.selectToken(out,"0+未冻结&1+工程回访冻结&2+投诉报修回访冻结&3+全部冻结",hfdjbz,true);
%> </td>
            <td width="25%"><font color="#0000CC">冻结人：</font><%=djr%> </td>
            <td width="25%"> <font color="#0000CC">冻结时间：</font><%=djsj%></td>
            <td width="25%"><font color="#0000CC">计划解冻时间：</font><%=jhjdsj%> </td>
          </tr>
          <tr bgcolor="#CCFFCC"> 
            <td colspan="4" align="left"><font color="#0000CC">冻结原因：</font><%=djyy%> 
            </td>
          </tr>
        </table>


<%
	if (gcjdbm.equals("4") || gcjdbm.equals("5"))
	{

		%>
		<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
			<tr bgcolor="#E8E8FF"> 
			  <td width="29%"> <font color="#0000CC">可保修标志</font>：<%
		cf.selectToken(out,"Y+保修&M+部分保修&N+不保修&0+未办理&1+预办理保修",kbxbz,true);
		%> </td>
			  <td width="30%"><font color="#0000CC">保修开始时间</font>：<%=bxkssj%></td>
			  <td width="30%"><font color="#0000CC">保修截止时间</font>：<%=bxjzsj%></td>
			</tr>
			<tr bgcolor="#E8E8FF"> 
			  <td colspan="3"><%=bybxsm%></td>
			</tr>
		  </table>
		  <table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
			<tr bgcolor="#CCCCCC"  align="center"> 
			  <td width="6%">保修</td>
			  <td width="40%">项目名称</td>
			  <td width="54%">情况说明</td>
			</tr>
				<%
				String bxxm="";
				String sfbx="";
				String qksm="";
				String mark="";
				ls_sql="SELECT bxxm,DECODE(sfbx,'Y','保修','N','<font color=\"#FF0000\">不保修</font>') sfbx,qksm";
				ls_sql+=" FROM crm_khbxxm";
				ls_sql+=" where khbh='"+khbh+"'";
				ls_sql+=" order by bxxm";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				while (rs.next())
				{
					bxxm=rs.getString("bxxm");
					sfbx=rs.getString("sfbx");
					qksm=cf.fillHtml(rs.getString("qksm"));

					%> 
					<tr  align="center" bgcolor="#E8E8FF"> 
					  <td><%=sfbx%></td>
					  <td><%=bxxm%></td>
					  <td><%=qksm%></td>
					</tr>
					<%
				}
				rs.close();
				ps.close();
				%>
		</table>
		<%
	}


%>

		  
<%
	String tsjlh=null;
	String slfsbm=null;
	String yqjjsj=null;
	String slsj=null;
	String slr=null;
	String tsnr=null;
	String lx=null;
	String lxmc=null;
	String sfjxhf=null;
	String jasj=null;

	String bgcolor=null;
	String bgcolor1=null;

	int row=0;
	ls_sql="select crm_tsjlhfmx.tsjlh,slfsmc,slsj,slr,yqjjsj,tsnr,lx,DECODE(lx,'1','投诉','2','报修') lxmc,crm_tsjlhfmx.sfjxhf,crm_tsjlhfmx.jasj";
	ls_sql+=" from  crm_tsjl,dm_slfsbm,crm_tsjlhfmx";
	ls_sql+=" where crm_tsjlhfmx.tsjlh=crm_tsjl.tsjlh and crm_tsjl.slfsbm=dm_slfsbm.slfsbm and crm_tsjlhfmx.hfjlh='"+hfjlh+"'";
	ls_sql+=" order by crm_tsjlhfmx.lrxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		tsjlh=cf.fillHtml(rs.getString("tsjlh"));
		slfsbm=cf.fillHtml(rs.getString("slfsmc"));
		yqjjsj=cf.fillHtml(rs.getDate("yqjjsj"));
		slsj=cf.fillHtml(rs.getDate("slsj"));
		slr=cf.fillHtml(rs.getString("slr"));
		tsnr=cf.fillHtml(rs.getString("tsnr"));
		lx=cf.fillHtml(rs.getString("lx"));
		lxmc=cf.fillHtml(rs.getString("lxmc"));
		sfjxhf=cf.fillNull(rs.getString("sfjxhf"));
		jasj=cf.fillNull(rs.getDate("jasj"));

		//获取姓名
		ls_sql=" SELECT yhmc";
		ls_sql+=" FROM sq_yhxx";
		ls_sql+=" where yhdlm='"+slr+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			slr=rs1.getString(1);
		}
		rs1.close();
		ps1.close();

		row++;

		if (row%2==1)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#CCFFCC";
		}
%> 
		<b><font color="#0000CC" style='FONT-SIZE: 14px'>第[<%=row%>]起：<%=slfsbm%><%=lxmc%>↗投诉报修记录号：<%=tsjlh%></font></b> 
		  <table border="1" width="100%" cellspacing="0" cellpadding="1" bgcolor="#FFFFFF"  style='FONT-SIZE: 12px'>
            <tr align="center" bgcolor="#E8E8FF"> 
              <td width="32%"><b>客户投诉保修情况</b></td>
              <td width="68%"><b>责任部门处理、客服回访情况</b></td>
            </tr>
            <tr> 
              <td align="left" width="32%" valign="top" > <b>受理</b>：<%=slr%>、<%=slsj%> 
                <HR>
                <b>要求解决时间</b>：<%=yqjjsj%> 
                <HR>
                <b>情况描述</b>： <BR>
                &nbsp;&nbsp;&nbsp;&nbsp;<U><font style="FONT-SIZE: 14px"><%=tsnr%></font></U> 
                <input type="hidden" name="tsjlh" value="<%=tsjlh%>" >

              </td>
              <td colspan="6" align="right" rowspan="2" valign="top" width="68%"> 
                <%
		String tsxlmc=null;
		String tsyybm=null;
		String tsyymc=null;
//		String dwmc=null;
		String clzt=null;
		String tzsj=null;
		String clsj=null;
		String clr=null;
		String clqk=null;
		String lrsj=null;
		String lrr=null;

		String hfjgbm=null;
		String sfjslx=null;
		String zzjgbm=null;
		String jsxbm=null;

		int row1=0;

		ls_sql="select crm_tswthfmx.hfjgbm,crm_tswthfmx.sfjslx,crm_tswthfmx.zzjgbm,crm_tswthfmx.jsxbm,tsxlmc,crm_tsbm.tsyybm";
		ls_sql+=" ,tsyymc,dwmc,DECODE(crm_tsbm.clzt,'0','未通知','1','已通知未处理','2','在处理','3','已解决') clzt,tzsj,clsj,clqk,clr,lrsj,lrr";
		ls_sql+=" from  crm_tsbm,dm_tsxlbm,dm_tsyybm,sq_dwxx,crm_tswthfmx";
		ls_sql+=" where crm_tswthfmx.hfjlh='"+hfjlh+"' and crm_tswthfmx.tsjlh='"+tsjlh+"'";
		ls_sql+=" and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm and crm_tsbm.tsyybm=dm_tsyybm.tsyybm and crm_tsbm.dwbh=sq_dwxx.dwbh";
		ls_sql+=" and crm_tswthfmx.tsjlh=crm_tsbm.tsjlh and crm_tswthfmx.tsyybm=crm_tsbm.tsyybm";
		ls_sql+=" order by crm_tsbm.tsyybm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		while (rs1.next())
		{
			hfjgbm=cf.fillNull(rs1.getString("hfjgbm"));
			sfjslx=cf.fillNull(rs1.getString("sfjslx"));
			zzjgbm=cf.fillNull(rs1.getString("zzjgbm"));
			jsxbm=cf.fillNull(rs1.getString("jsxbm"));

			tsxlmc=cf.fillHtml(rs1.getString("tsxlmc"));
			tsyybm=cf.fillHtml(rs1.getString("tsyybm"));
			tsyymc=cf.fillHtml(rs1.getString("tsyymc"));
			dwmc=cf.fillHtml(rs1.getString("dwmc"));
			clzt=cf.fillHtml(rs1.getString("clzt"));
			dwmc=cf.fillHtml(rs1.getString("dwmc"));
			tzsj=cf.fillHtml(rs1.getDate("tzsj"));
			clsj=cf.fillHtml(rs1.getDate("clsj"));
			clr=cf.fillHtml(rs1.getString("clr"));
			clqk=cf.fillHtml(rs1.getString("clqk"));
			lrsj=cf.fillNull(rs1.getDate("lrsj"));
			lrr=cf.fillNull(rs1.getString("lrr"));

			row1++;

			if (row1%2==1)
			{
				bgcolor1="#FFFFFF";
			}
			else{
				bgcolor1="#E8E8FF";
			}
			%> 
                <table border="1" width="100%" cellspacing="0" cellpadding="1" bgcolor="<%=bgcolor1%>" style='FONT-SIZE: 12px'>
                  <tr> 
                    <td height="24" width="53%" align="left" valign="top">
					
						<b>责任部门：</b><%=dwmc%><font color="#CC0066">↗<%=clzt%></font><BR>
						<HR>
						<b>原因分类</b>：<%=tsxlmc%>↗<%=tsyymc%> 
						<HR>
						<b>通知时间</b>：<%=tzsj%> 
						<HR>

						<b>处理情况</b>： 
						<%
						if (lrr.equals("") && lrsj.equals(""))
						{
							%> 
							目前未处理 
							<%
						}
						else{
							%> 
							<BR>
							&nbsp;&nbsp;&nbsp;&nbsp;<U><font style="FONT-SIZE: 14px"><%=clqk%></font></U> 
							<BR>
							&nbsp;&nbsp;&nbsp;&nbsp;<U><b>录入</b>：<%=lrr%>、<%=lrsj%></U>&nbsp;&nbsp;<U><b>处理</b>：<%=clr%>、<%=clsj%></U> 
							<%
						}
						%> 
					
						
					</td>
                    
                  <td colspan="4" width="47%" valign="top"> <B>客服回访时填写</B><IMG src="/images/168.gif"> 
                    <HR>
						<b><font color="#FF0000">*</font>问题目前处理情况</b>： 
							<%
								cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hflxbm='11' order by hfjgbm",hfjgbm,true);
							%> 

						<%
						if (lx.equals("2"))//1：投诉；2：报修
						{
							%> 
							<BR>
                    <b><font color="#FF0000">*</font>是否及时联系客户</b>： <%
									cf.selectToken(out,"Y+及时联系&N+未及时联系&W+情况未知",sfjslx,true);
								%> <%
						}
						%> 
						<P>

						<b><font color="#FF0000">*</font>结案客户是否满意</b>： 
							<%
								cf.selectItem(out,"select zzjgbm,zzjgmc from dm_zzjgbm order by zzjgbm",zzjgbm,true);
							%> 

						<BR>
						<b><font color="#FF0000">*</font>解决问题是否及时</b>： 
							<%
								cf.selectItem(out,"select jsxbm,jsxmc from dm_jsxbm order by jsxbm",jsxbm,true);
							%> 
				
					
                    </td>
                  </tr>
                </table>
                <%
		}
		rs1.close();
		ps1.close();
		%> </td>
            </tr>
            <tr> 
              <td align="left" width="32%" valign="top" > <b><font color="#FF0000">*</font>是否结案</b>： 
                <%
					cf.radioToken(out, "sfjxhf"+tsjlh,"Y+不结案&N+结案",sfjxhf,true);
				%>  <BR>
                <b><font color="#FF0000">*</font>结案时间</b>：<%=jasj%> 
              </td>
            </tr>
          </table>
		<BR>
<%
	}
	rs.close();
	ps.close();
%>

		<b>客服回访时填写</b><img src="/images/168.gif" > 
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right"><font color="#FF0000">*</font>客户回访情况</div>
              </td>
              <td colspan="3"><%=khhfqk%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right">回访中出现的新问题</div>
              </td>
              <td colspan="3"><%=cxxwt%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" bgcolor="#E8E8FF"> 
                <div align="right"><font color="#FF0000">*</font>处理方式</div>
              </td>
              <td width="34%" bgcolor="#E8E8FF"> 
<%
	cf.selectToken(out,"0+不需处理&1+反馈相关部门",clfs,true);
%> 
              </td>
              <td rowspan="5" bgcolor="#E8E8FF" width="16%"> 
                <div align="right">反馈部门</div>
              </td>
              <td rowspan="5" bgcolor="#E8E8FF" width="34%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" size="9" multiple>
                  <option value=""></option>
<%
				String sql="select sq_tsclbm.dwbh,a.dwmc||'（'||b.dwmc||'）' from sq_tsclbm,sq_dwxx a,sq_dwxx b  where sq_tsclbm.dwbh=a.dwbh and a.ssfgs=b.dwbh and sq_tsclbm.ssfgs='"+ssfgs+"' order by sq_tsclbm.dwbh";
				cf.mutilSelectItem(out,sql,"select dwbh from crm_tshffkbm where hfjlh="+hfjlh);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="16%" align="right">下次回访时间</td>
              
            <td width="34%"><%=xchfrq%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><font color="#FF0000">*</font>回访人</td>
              
            <td width="34%"><%=hfr%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><font color="#FF0000">*</font>回访时间</td>
              
            <td width="34%"><%=hfsj%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"> 
                <div align="right"><font color="#FF0000">*</font>回访部门</div>
              </td>
              <td width="34%"> 
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+hfbm+"'",hfbm,true);
%> 
              </td>
            </tr>
          </table>

	  </div>
    </td>
  </tr>
</table>
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

