<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String crm_yjdjl_jdjlh=null;
String khbh=null;
String crm_zxkhxx_khxm=null;
String crm_zxkhxx_fwdz=null;
String crm_zxkhxx_hth=null;
String crm_zxkhxx_sjs=null;
String crm_zxkhxx_xjf=null;
String crm_yjdjl_sqrq=null;
String crm_yjdjl_sqr=null;
String crm_yjdjl_sqrlxdh=null;
String crm_yjdjl_sfxtp=null;
String crm_yjdjl_jhjdrq=null;
String crm_yjdjl_jhjdsj=null;
String crm_yjdjl_sqsm=null;
String crm_yjdjl_zcwcsj=null;
String crm_yjdjl_jdqrwcsj=null;
String crm_yjdjl_fbr=null;
String crm_yjdjl_fbsj=null;
String crm_yjdjl_zzqrjdrq=null;
String crm_yjdjl_zzqrjdsj=null;
String crm_yjdjl_sjjdsj=null;
String crm_yjdjl_jdsfcg=null;
String crm_yjdjl_sfkkg=null;
String crm_yjdjl_tzsfqr=null;
String crm_yjdjl_fasfkx=null;
String crm_yjdjl_khsfqr=null;
String crm_yjdjl_xcfzrqr=null;
String crm_yjdjl_qtczdqr=null;
String crm_yjdjl_clzt=null;
String crm_yjdjl_lrr=null;
String crm_yjdjl_lrsj=null;
String crm_yjdjl_lrbm=null;
String crm_yjdjl_sbsfcl=null;
String crm_yjdjl_tpshr=null;
String crm_yjdjl_tpshsj=null;
String crm_yjdjl_tpsftg=null;
String crm_yjdjl_tpsm=null;
String crm_yjdjl_jdqrjg=null;
String sgdmc=null;
String zjxm=null;

String wherecrm_yjdjl_jdjlh=null;
wherecrm_yjdjl_jdjlh=cf.GB2Uni(request.getParameter("jdjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select sgdmc,crm_yjdjl.zjxm,crm_yjdjl.jdjlh as crm_yjdjl_jdjlh,crm_yjdjl.khbh as khbh,crm_zxkhxx.khxm as crm_zxkhxx_khxm,crm_zxkhxx.fwdz as crm_zxkhxx_fwdz,crm_zxkhxx.hth as crm_zxkhxx_hth,crm_zxkhxx.sjs as crm_zxkhxx_sjs,crm_yjdjl.sqrq as crm_yjdjl_sqrq,crm_yjdjl.sqr as crm_yjdjl_sqr,crm_yjdjl.sqrlxdh as crm_yjdjl_sqrlxdh,crm_yjdjl.jhjdrq as crm_yjdjl_jhjdrq,crm_yjdjl.jhjdsj as crm_yjdjl_jhjdsj,crm_yjdjl.sqsm as crm_yjdjl_sqsm,crm_yjdjl.fbr as crm_yjdjl_fbr,crm_yjdjl.fbsj as crm_yjdjl_fbsj,crm_yjdjl.zzqrjdrq as crm_yjdjl_zzqrjdrq,crm_yjdjl.zzqrjdsj as crm_yjdjl_zzqrjdsj,crm_yjdjl.sjjdsj as crm_yjdjl_sjjdsj,crm_yjdjl.jdsfcg as crm_yjdjl_jdsfcg,crm_yjdjl.clzt as crm_yjdjl_clzt,crm_yjdjl.lrr as crm_yjdjl_lrr,crm_yjdjl.lrsj as crm_yjdjl_lrsj,crm_yjdjl.lrbm as crm_yjdjl_lrbm,decode(crm_zxkhxx.xjf,'1','新房','2','旧房')crm_zxkhxx_xjf ";
	ls_sql+=" from  crm_zxkhxx,crm_yjdjl,sq_sgd";
	ls_sql+=" where crm_yjdjl.khbh=crm_zxkhxx.khbh and crm_yjdjl.sgd=sq_sgd.sgd(+) and  (crm_yjdjl.jdjlh='"+wherecrm_yjdjl_jdjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		crm_yjdjl_jdjlh=cf.fillNull(rs.getString("crm_yjdjl_jdjlh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		crm_zxkhxx_khxm=cf.fillNull(rs.getString("crm_zxkhxx_khxm"));
		crm_zxkhxx_fwdz=cf.fillNull(rs.getString("crm_zxkhxx_fwdz"));
		crm_zxkhxx_hth=cf.fillNull(rs.getString("crm_zxkhxx_hth"));
		crm_zxkhxx_sjs=cf.fillNull(rs.getString("crm_zxkhxx_sjs"));
		crm_yjdjl_sqrq=cf.fillNull(rs.getDate("crm_yjdjl_sqrq"));
		crm_yjdjl_sqr=cf.fillNull(rs.getString("crm_yjdjl_sqr"));
		crm_yjdjl_sqrlxdh=cf.fillNull(rs.getString("crm_yjdjl_sqrlxdh"));
		crm_yjdjl_jhjdrq=cf.fillNull(rs.getDate("crm_yjdjl_jhjdrq"));
		crm_yjdjl_jhjdsj=cf.fillNull(rs.getString("crm_yjdjl_jhjdsj"));
		crm_yjdjl_sqsm=cf.fillNull(rs.getString("crm_yjdjl_sqsm"));
		crm_yjdjl_fbr=cf.fillNull(rs.getString("crm_yjdjl_fbr"));
		crm_yjdjl_fbsj=cf.fillNull(rs.getDate("crm_yjdjl_fbsj"));
		crm_yjdjl_zzqrjdrq=cf.fillNull(rs.getDate("crm_yjdjl_zzqrjdrq"));
		crm_yjdjl_zzqrjdsj=cf.fillNull(rs.getString("crm_yjdjl_zzqrjdsj"));
		crm_yjdjl_sjjdsj=cf.fillNull(rs.getDate("crm_yjdjl_sjjdsj"));
		crm_yjdjl_jdsfcg=cf.fillNull(rs.getString("crm_yjdjl_jdsfcg"));
		crm_yjdjl_clzt=cf.fillNull(rs.getString("crm_yjdjl_clzt"));
		crm_yjdjl_lrr=cf.fillNull(rs.getString("crm_yjdjl_lrr"));
		crm_yjdjl_lrsj=cf.fillNull(rs.getDate("crm_yjdjl_lrsj"));
		crm_yjdjl_lrbm=cf.fillNull(rs.getString("crm_yjdjl_lrbm"));
		crm_zxkhxx_xjf=cf.fillNull(rs.getString("crm_zxkhxx_xjf"));
	}
	rs.close();
	ps.close();

%>

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">预交底记录</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    预交底记录号  </td>
  <td width="32%"> 
    <%=crm_yjdjl_jdjlh%>  </td>
  <td align="right" width="18%"> 
    客户编号  </td>
  <td width="32%"> 
    <%=khbh%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    客户姓名  </td>
  <td width="32%"> 
    <%=crm_zxkhxx_khxm%>  </td>
  <td align="right" width="18%"> 
    房屋地址  </td>
  <td width="32%"> 
    <%=crm_zxkhxx_fwdz%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    合同号  </td>
  <td width="32%"> 
    <%=crm_zxkhxx_hth%>  </td>
  <td align="right" width="18%"> 
    设计师  </td>
  <td width="32%"> 
    <%=crm_zxkhxx_sjs%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#CCCCCC">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">处理状态</td>
  <td><%
	cf.radioToken(out, "1+申请&2+确认&3+特批完成&4+发布&5+已预交底",crm_yjdjl_clzt,true);
%></td>
  <td align="right">新旧房</td>
  <td><%=crm_zxkhxx_xjf%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    申请日期  </td>
  <td width="32%"> 
    <%=crm_yjdjl_sqrq%>  </td>
  <td align="right" width="18%"> 
    申请人  </td>
  <td width="32%"> 
    <%=crm_yjdjl_sqr%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    申请人联系电话  </td>
  <td width="32%"> 
    <%=crm_yjdjl_sqrlxdh%>  </td>
  <td align="right" width="18%">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    计划预交底日期  </td>
  <td width="32%"> 
    <%=crm_yjdjl_jhjdrq%>  </td>
  <td align="right" width="18%"> 
    计划预交底时间  </td>
  <td width="32%"> 
    <%=crm_yjdjl_jhjdsj%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    申请说明  </td>
  <td colspan="3"> 
    <%=crm_yjdjl_sqsm%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入部门 </td>
  <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh",crm_yjdjl_lrbm,true);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 录入人 </td>
  <td><%=crm_yjdjl_lrr%> </td>
  <td align="right"> 录入时间 </td>
  <td><%=crm_yjdjl_lrsj%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#CCCCCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">施工队</td>
  <td><%=sgdmc%></td>
  <td align="right">质检</td>
  <td><%=zjxm%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">派单人 </td>
  <td><%=crm_yjdjl_fbr%></td>
  <td align="right">派单时间</td>
  <td><%=crm_yjdjl_fbsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">最终确认预交底日期</td>
  <td><%=crm_yjdjl_zzqrjdrq%></td>
  <td align="right">最终确认预交底时间</td>
  <td><%=crm_yjdjl_zzqrjdsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#CCCCCC">&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">预交底是否成功 </td>
  <td width="32%"><%
	cf.radioToken(out, "Y+成功&N+否",crm_yjdjl_jdsfcg,true);
%></td>
  <td align="right" width="18%"> 
    实际预交底时间  </td>
  <td width="32%"> 
    <%=crm_yjdjl_sjjdsj%>  </td>
</tr>
</table>
<%

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
double dj=0;

int fjsl=0;
String[] fjbm=null;
String[] fjmc=null;
double sl=0;

int allw=433;

	ls_sql="SELECT count(distinct jgwzbm)";
	ls_sql+=" FROM crm_yjdmx ";
    ls_sql+=" where khbh='"+khbh+"'";
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

  <table  border="1" cellspacing="0" cellpadding="1" width="<%=(allw+30+50)%>" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center" > 
	<td width="70" >项目编号</td>
    <td width="200">项目名称</td>
    <td width="50">计量单位</td>
    <td width="53">标准单价</td>
    <td width="53">工程量合计</td>

    </tr>

<%
	ls_sql="SELECT xh,xmbh,dqbm,xmmc,jldwmc,dj,bjjbmc";
	ls_sql+=" FROM bj_bjxmmx,jdm_jldwbm,bdm_bjjbbm  ";
    ls_sql+=" where bj_bjxmmx.jldwbm=jdm_jldwbm.jldwbm(+) and bj_bjxmmx.bjjb=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and bj_bjxmmx.khbh='"+khbh+"'";
    ls_sql+=" and bj_bjxmmx.sfxyyjd='Y'";
    ls_sql+=" order by bj_bjxmmx.xmpx";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		xmbh=rs.getString("xmbh");
		xh=rs.getString("xh");
		dqbm=rs.getString("dqbm");
		xmmc=rs.getString("xmmc");
		jldwmc=rs.getString("jldwmc");
		bjjbmc=rs.getString("bjjbmc");
		dj=rs.getDouble("dj");


		if (row%2==0)
		{
			bgcolor="#efe1ff";
		}
		else{
			bgcolor="#FFFFFF";
		}

		sl=0;
		ls_sql="SELECT sum(bj_gclmx.sl)";
		ls_sql+=" FROM bj_gclmx ";
		ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			sl=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();
		if (sl==0)
		{
			slstr="";
		}
		else{
			slstr=cf.doubleTrimStr(sl,2);
		}

		//输出每行数据
		%> 

	<td align="left" width="70" style="FONT-WEIGHT: bold; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff">
        <input name="xh" type="hidden" value="<%=xh%>"><%=xmbh.trim()%></A>
	</td>
	<td width="200" style="FONT-WEIGHT: bold; LEFT: expression(this.parentElement.offsetParent.parentElement.scrollLeft); POSITION: relative; BACKGROUND-COLOR: #efe1ff"><%=xmmc%>
	</td>
	<td align="center" width="50"><%=jldwmc%></td>
	  <td align="center" width="53"><%=dj%>
	  </td>
	  <td align="right" width="53">
		<input type="text" name="zgcl" size="4" value="<%=slstr%>" readonly style="border-color: #FFFFFF #FFFFFF #FFFFFF;border-style:solid">
	  </td>
      <%
		double gczl=0;

		for (int i=0;i<fjbm.length ;i++ )
		{
			sl=-1;
			ls_sql="SELECT bj_gclmx.sl";
			ls_sql+=" FROM bj_gclmx ";
			ls_sql+=" where khbh='"+khbh+"' and xmbh='"+xmbh+"' and jgwzbm='"+fjmc[i]+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				sl=rs1.getDouble("sl");
				gczl+=sl;
				
			}
			rs1.close();
			ps1.close();

			if (sl==-1)
			{
				slstr="";
			}
			else{
				slstr=cf.doubleTrimStr(sl,2);
			}

			%>
			<td><%=slstr%></td>
			<%
		}

	  %>
  </tr>

	
	<%
	}
	rs.close();
	ps.close();

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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

</body>
</html>
