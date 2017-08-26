<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String hfbm=(String)session.getAttribute("dwbh");
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");

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

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String lx=cf.GB2Uni(request.getParameter("lx"));
String lxsql="";
if (lx!=null)
{
	if (!(lx.equals("null")))	lxsql=" and  (crm_tsjl.lx='"+lx+"')";
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;
String wheresql="";
String hfjlh=null;
try {
	conn=cf.getConnection();

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

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  crm_tsjl";
	ls_sql+=" where khbh='"+khbh+"' and clzt='0' ";//0：未受理；1：已受理；2：在处理；3：结案；9:不立案
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("错误！该客户有未受理的投诉报修记录，必须先受理，才能回访");
		return;
	}

	//回访记录号
	ls_sql="select NVL(max(substr(hfjlh,8,3)),0)";
	ls_sql+=" from  crm_tshfjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
//	out.println(ls_sql);
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

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:12">
  <tr>
    <td width="100%"> 
      <div align="center"> 客户投诉报修回访（回访记录号：<%=hfjlh%>）</div>
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
		if (kbxbz.equals("N"))
		{
			%> 
			<script language="javascript">
				var ie = "<marquee onmouseover='this.stop()' onmouseout='this.start()' scrollDelay=180 ><b><font color='#0000CC' class='3dfont' size='4' face='华文行楷'>注意！该客户[不能保修]</font></b></marquee><br>";
				document.write(ie);
			</script>
			<%
		}
		else if (kbxbz.equals("M"))
		{
			%> 
			<script language="javascript">
				var ie = "<marquee onmouseover='this.stop()' onmouseout='this.start()' scrollDelay=180 ><b><font color='#0000CC' class='3dfont' size='4' face='华文行楷'>注意！该客户[部分保修]</font></b></marquee><br>";
				document.write(ie);
			</script>
			<%
		}
		else if (kbxbz.equals("0"))
		{
			%> 
			<script language="javascript">
				var ie = "<marquee onmouseover='this.stop()' onmouseout='this.start()' scrollDelay=180 ><b><font color='#0000CC' class='3dfont' size='4' face='华文行楷'>注意！该客户[未办理保修]</font></b></marquee><br>";
				document.write(ie);
			</script>
			<%
		}
		else if (kbxbz.equals("Y") && syts<0)
		{
			%> 
			<script language="javascript">
				var ie = "<marquee onmouseover='this.stop()' onmouseout='this.start()' scrollDelay=180 ><b><font color='#0000CC' class='3dfont' size='4' face='华文行楷'>注意！该客户保修已过期，保修截止时间："+bxjzsj+"</font></b></marquee><br>";
				document.write(ie);
			</script>
			<%
		}

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
		<%
	}


%>



<%
if (count>0)
{
%>
	<br>
	<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	  <tr bgcolor="#CCCCCC" align="center"> 
		<td width="8%"> 
		  <div align="center"><font color="#006666">回访时间</font></div>
		</td>
		<td width="6%"> 
		  <div align="center"><font color="#006666">回访人</font></div>
		</td>
		<td width="55%"> 
		  <div align="center"><font color="#006666">客户回访情况</font></div>
		</td>
		<td width="41%"> 
		  <div align="center"><font color="#006666">回访中出现的新问题</font></div>
		</td>
	  </tr>
	<%
	String khhfqk=null;
	String cxxwt=null;
	String hfsj=null;
	String hfr=null;

	ls_sql="select hfsj,hfr,khhfqk,cxxwt";
	ls_sql+=" from  crm_tshfjl";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by hfsj";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khhfqk=cf.fillNull(rs.getString("khhfqk"));
		cxxwt=cf.fillNull(rs.getString("cxxwt"));
		hfsj=cf.fillNull(rs.getDate("hfsj"));
		hfr=cf.fillNull(rs.getString("hfr"));

		%> 
		<tr bgcolor="#FFFFFF"> 
		  <td align="center" ><%=hfsj%></td>
		  <td align="center" ><%=hfr%></td>
		  <td ><%=khhfqk%></td>
		  <td ><%=cxxwt%></td>
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


<form method="post" action="SaveInsertCrm_tshfjl.jsp" name="insertform" target="_blank">
          <%
	String tsjlh=null;
	String slfsbm=null;
	String yqjjsj=null;
	String ldyqjjsj=null;
	String tsbxsj=null;
	String slsj=null;
	String slr=null;
	String tslrsj=null;
	String tslrr=null;
	String tsnr=null;
	String lxmc=null;

	String bgcolor=null;
	String bgcolor1=null;

	int row=0;
	ls_sql="select tsjlh,slfsmc,tsbxsj,slsj,slr,lrsj,lrr,yqjjsj,ldyqjjsj,tsnr,lx,DECODE(lx,'1','投诉','2','报修') lxmc";
	ls_sql+=" from  crm_tsjl,dm_slfsbm";
	ls_sql+=" where crm_tsjl.slfsbm=dm_slfsbm.slfsbm and crm_tsjl.khbh='"+khbh+"'";
	ls_sql+="  and crm_tsjl.clzt not in('3','9')";
	ls_sql+=lxsql;
	ls_sql+="  order by tsjlh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		tsjlh=cf.fillHtml(rs.getString("tsjlh"));
		slfsbm=cf.fillHtml(rs.getString("slfsmc"));
		yqjjsj=cf.fillHtml(rs.getDate("yqjjsj"));
		ldyqjjsj=cf.fillHtml(rs.getDate("ldyqjjsj"));
		tsbxsj=cf.fillHtml(rs.getDate("tsbxsj"));
		slsj=cf.fillHtml(rs.getDate("slsj"));
		slr=cf.fillHtml(rs.getString("slr"));
		tslrsj=cf.fillHtml(rs.getDate("lrsj"));
		tslrr=cf.fillHtml(rs.getString("lrr"));
		tsnr=cf.fillHtml(rs.getString("tsnr"));
		lx=cf.fillHtml(rs.getString("lx"));
		lxmc=cf.fillHtml(rs.getString("lxmc"));


		row++;

		if (row%2==1)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#CCFFCC";
		}
%> <b><font color="#0000CC" style='FONT-SIZE: 14px'>第[<%=row%>]起：<%=slfsbm%><%=lxmc%>↗<A HREF="/tsgl/cx/ViewCrm_tsjl.jsp?tsjlh=<%=tsjlh%>" target="_blank">记录号：<%=tsjlh%></A></font></b> 
          <table border="1" width="100%" cellspacing="0" cellpadding="1" bgcolor="#FFFFFF"  style='FONT-SIZE: 12px'>
            <tr align="center" bgcolor="#E8E8FF"> 
              <td width="32%"><b>客户投诉报修情况</b></td>
              <td width="68%"><b>责任部门处理、客服回访情况</b></td>
            </tr>
            <tr> 
              <td align="left" width="32%" valign="top" ><b>受理</b>：<%=slr%>,<%=slsj%> 
                <HR>
                <b>客户要求解决时间</b>：<%=yqjjsj%> 
                <br>
				<b>领导要求解决时间</b>：<%=ldyqjjsj%> 
                <HR>
                <b>情况描述</b>： <BR>
                &nbsp;&nbsp;&nbsp;&nbsp;<U><font style="FONT-SIZE: 14px"><%=tsnr%></font></U> 
                <input type="hidden" name="tsjlh" value="<%=tsjlh%>" >

              </td>
              <td  align="right" rowspan="2" valign="top" width="68%"> <%
		String tsxlmc=null;
		String tsyybm=null;
		String tsyymc=null;
//		String dwmc=null;
		String clzt=null;
		String sfytz=null;
		String tzsj=null;
		String jssj=null;
		String jhcfasj=null;
		String sjcfasj=null;
		String jhjjsj=null;

		int row1=0;

		String nonestr="";
		String blockstr="";




		ls_sql="select tsxlmc,crm_tsbm.tsyybm,tsyymc,dwmc,DECODE(sfytz,'0','(未通知)','1','(已通知)','3','(不需通知)') sfytz ";
		ls_sql+=" ,DECODE(crm_tsbm.clzt,'1','未接收','2','已接收等待出方案','D','已接收不需出方案','E','不属实','4','已接收等待出现场','6','已出现场等待出方案','7','已出方案等待审核','8','已出方案不需审核','9','方案审核通过','A','方案审核未通过','3','已解决','C','回访未解决','B','在处理','5','结案') clzt";
		ls_sql+=" ,tzsj,jssj,jhcfasj,sjcfasj,jhjjsj";

		ls_sql+=" from  crm_tsbm,dm_tsxlbm,dm_tsyybm,sq_dwxx";
		ls_sql+=" where crm_tsbm.tsjlh='"+tsjlh+"'";
		ls_sql+=" and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm(+)  ";
		ls_sql+=" and crm_tsbm.tsyybm=dm_tsyybm.tsyybm(+)  ";
		ls_sql+=" and crm_tsbm.dwbh=sq_dwxx.dwbh(+)";
		ls_sql+=" order by crm_tsbm.tsyybm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		while (rs1.next())
		{
			tsxlmc=cf.fillHtml(rs1.getString("tsxlmc"));
			tsyybm=cf.fillHtml(rs1.getString("tsyybm"));
			tsyymc=cf.fillHtml(rs1.getString("tsyymc"));
			dwmc=cf.fillHtml(rs1.getString("dwmc"));
			sfytz=cf.fillHtml(rs1.getString("sfytz"));
			clzt=cf.fillHtml(rs1.getString("clzt"));
			dwmc=cf.fillHtml(rs1.getString("dwmc"));
			tzsj=cf.fillHtml(rs1.getDate("tzsj"));
			jssj=cf.fillHtml(rs1.getDate("jssj"));
			jhcfasj=cf.fillHtml(rs1.getDate("jhcfasj"));
			sjcfasj=cf.fillHtml(rs1.getDate("sjcfasj"));
			jhjjsj=cf.fillHtml(rs1.getDate("jhjjsj"));

			nonestr+="id"+tsjlh+tsyybm+".style.display ='none';";
			blockstr+="id"+tsjlh+tsyybm+".style.display ='block';";

			row1++;

			if (row1%2==1)
			{
				bgcolor1="#FFFFFF";
			}
			else{
				bgcolor1="#E8E8FF";
			}
			%> 
                <table border="1" width="100%"  height="150" cellspacing="0" cellpadding="1" bgcolor="<%=bgcolor1%>" style='FONT-SIZE: 12px'>
                  <tr> 
                    <td width="53%" align="left" valign="top"> 
						
						<b>责任部门：</b><%=dwmc%><font color="#CC0066">↗<%=clzt%><%=sfytz%></font><BR>
						<HR>
						<b>原因分类</b>：<%=tsxlmc%>↗<%=tsyymc%> 
						<HR>
						<b>接收时间</b>：<%=jssj%>   &nbsp;&nbsp;&nbsp;&nbsp;<b>计划出方案时间</b>：<%=jhcfasj%> 
						<BR>
						<b>计划解决</b>：<%=jhjjsj%>  &nbsp;&nbsp;&nbsp;&nbsp;<b>实际出方案时间</b>：<%=sjcfasj%>    
						<HR>

						<b>处理情况</b>： 
						<%
						String cl_clsj=null;
						String cl_clr=null;
						String cl_clqk=null;
						String cl_clzt=null;
						int clxh=0;
						ls_sql =" select clr,clsj,clqk,DECODE(crm_tsbxcljl.clzt,'2','未解决','3','已解决') clzt";
						ls_sql+=" from  crm_tsbxcljl";
						ls_sql+=" where tsjlh='"+tsjlh+"'";
						ls_sql+=" and tsyybm='"+tsyybm+"'";
						ls_sql+=" order by cljlh";
						ps2= conn.prepareStatement(ls_sql);
						rs2 =ps2.executeQuery();
						while (rs2.next())
						{
							cl_clsj=cf.fillHtml(rs2.getDate("clsj"));
							cl_clr=cf.fillHtml(rs2.getString("clr"));
							cl_clqk=cf.fillHtml(rs2.getString("clqk"));
							cl_clzt=cf.fillHtml(rs2.getString("clzt"));

							clxh++;

							%> 
							<BR>
							<BR>
							<U>第<%=clxh%>次（<%=cl_clzt%>）：<%=cl_clr%>、<%=cl_clsj%></U> 
							<BR>
							&nbsp;&nbsp;&nbsp;&nbsp;<U><font style="FONT-SIZE: 14px"><%=cl_clqk%></font></U> 
							<%
						}
						rs2.close();
						ps2.close();
						
						%> 

					</td>
                    <td colspan="4" width="47%" valign="top" align="center">
                      <table width="100%" border="0" cellpadding="0" cellspacing="0" style='FONT-SIZE: 12px'>
                        <tr>
                          <td align="center">
						
						<B>客服回访时填写</B><IMG SRC="/images/168.gif"> 
						<HR>
						<b><font color="#FF0000">*</font>问题目前处理情况</b>： 
						<select name="hfjgbm<%=tsjlh%><%=tsyybm%>" style="FONT-SIZE:12PX;WIDTH:132PX">
							<option value=""></option>
							<%
								cf.selectItem(out,"select hfjgbm,hfjgmc from dm_tshfjgbm order by hfjgbm","");
							%> 
						</select>

						<%
						if (lx.equals("2"))//1：投诉；2：报修
						{
							%> 
							<BR>
							<b><font color="#FF0000">*</font>是否及时联系客户</b>： 
							<select name="sfjslx<%=tsjlh%><%=tsyybm%>" style="FONT-SIZE:12PX;WIDTH:132PX">
								<option value=""></option>
								<%
									cf.selectToken(out,"Y+及时联系&N+未及时联系&W+情况未知","");
								%> 
							</select>
							<%
						}
						%> 
						  </td>
                        </tr>
                      </table>
							
                      <table width="100%"  bgcolor="#FFFFCC" border="0" cellpadding="0" cellspacing="0"  id="id<%=tsjlh%><%=tsyybm%>" style="display:none" style='FONT-SIZE: 12px'>
                        <tr>
                          <td align="center">
						<BR><B>若结案请选择</B>↘↘↘<BR>

						<b><font color="#FF0000">*</font>结案客户是否满意</b>： 
						<select name="zzjgbm<%=tsjlh%><%=tsyybm%>" style="FONT-SIZE:12PX;WIDTH:132PX">
							<option value=""></option>
							<%
								cf.selectItem(out,"select zzjgbm,zzjgmc from dm_zzjgbm order by zzjgbm","");
							%> 
						</select>

						<BR>
						<b><font color="#FF0000">*</font>解决问题是否及时</b>： 
						<select name="jsxbm<%=tsjlh%><%=tsyybm%>" style="FONT-SIZE:12PX;WIDTH:132PX">
							<option value=""></option>
							<%
								cf.selectItem(out,"select jsxbm,jsxmc from dm_jsxbm order by jsxbm","");
							%> 
						</select>

						  </td>
                        </tr>
                      </table>

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
                <input type="radio" name="sfjxhf<%=tsjlh%>" value="Y" onclick="jasj<%=tsjlh%>.value='';<%=nonestr%>" >
                不结案 
                <input type="radio" name="sfjxhf<%=tsjlh%>" value="N" onclick="jasj<%=tsjlh%>.value='<%=cf.today()%>';<%=blockstr%>">
                结案 
				<IMG SRC="/images/169.gif" >
				<BR>
                <b><font color="#FF0000">*</font>结案时间</b>： 
                <input type="text" name="jasj<%=tsjlh%>" value="" size="12" maxlength="10"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onDblClick="JSCalendar(this)">


              </td>
            </tr>
          </table>
		<BR>
          <%
	}
	rs.close();
	ps.close();

	if (row==0)
	{
		return;
	}
%> 
		<b>客服回访时填写</b><img src="/images/168.gif" > 
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right"><font color="#FF0000">*</font>客户回访情况</div>
              </td>
              <td colspan="3"> 
                <textarea name="khhfqk" cols="81" rows="3"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right">回访中出现的新问题</div>
              </td>
              <td colspan="3"> 
                <textarea name="cxxwt" cols="81" rows="3"></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" bgcolor="#E8E8FF"> 
                <div align="right"><font color="#FF0000">*</font>处理方式</div>
              </td>
              <td width="34%" bgcolor="#E8E8FF"> 
                <select name="clfs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="f2(insertform)">
                  <option value=""></option>
                  <option value="0">不需处理</option>
                  <option value="1">反馈相关部门</option>
                </select>
              </td>
              <td rowspan="6" bgcolor="#E8E8FF" width="16%"> 
                <div align="right">反馈部门</div>
              </td>
              <td rowspan="6" bgcolor="#E8E8FF" width="34%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" size="11" multiple>
                  <option value=""></option>
<%
	String sql="select sq_tsclbm.dwbh,a.dwmc||'（'||b.dwmc||'）' from sq_tsclbm,sq_dwxx a,sq_dwxx b  where sq_tsclbm.dwbh=a.dwbh and a.ssfgs=b.dwbh and sq_tsclbm.ssfgs='"+ssfgs+"' order by sq_tsclbm.dwbh";
	cf.selectItem(out,sql,"");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="16%" align="right">需人工通知反馈部门</td>
              <td width="34%">
                <input type="radio" name="hffkbmclzt" value="0">
                需要 
                <input type="radio" name="hffkbmclzt" value="1">
                不需要
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="16%" align="right">下次回访时间</td>
              <td width="34%">
                <input type="text" name="xchfrq" value="" size="20" maxlength="10"ondblclick="JSCalendar(this)" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><font color="#FF0000">*</font>回访人</td>
              <td width="34%"> 
                <input type="text" name="hfr" value="<%=yhmc%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"><font color="#FF0000">*</font>回访时间</td>
              <td width="34%"> 
                <input type="text" name="hfsj" value="<%=cf.today()%>" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right"> 
                <div align="right"><font color="#FF0000">*</font>回访部门</div>
              </td>
              <td width="34%"> 
                <select name="hfbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+hfbm+"'","");
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">
                <input type="hidden" name="hfjlh" value="<%=hfjlh%>" >
                <input type="hidden" name="khbh" value="<%=khbh%>" >
              </td>
            </tr>
          </table>
</form>
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
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (rs2 != null) rs2.close(); 
		if (ps2 != null) ps2.close(); 
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
function f2(FormName)//参数FormName:Form的名称
{
	if (FormName.clfs.value=='0')
	{
		notAll(FormName.dwbh);
	}
}

function f_do(FormName)//参数FormName:Form的名称
{
	f2(FormName);

	if(	javaTrim(FormName.khhfqk)=="") {
		alert("请选择[客户回访情况]！");
		FormName.khhfqk.focus();
		return false;
	}

	if(	javaTrim(FormName.clfs)=="") {
		alert("请选择[处理方式]！");
		FormName.clfs.focus();
		return false;
	}
	if (FormName.clfs.value=='1')
	{
		if (!selectChecked(FormName.dwbh)){
			alert("请选择[反馈部门]！");
			FormName.dwbh.focus();
			return false;
		}

		if(	!radioChecked(FormName.hffkbmclzt)) {
			alert("请选择[需人工通知反馈部门]！");
			FormName.hffkbmclzt[0].focus();
			return false;
		}
	}

	if(!(isDatetime(FormName.xchfrq, "下次回访日期"))) {
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
