<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<%
String zgsmc=(String)session.getAttribute("zgsmc");
%>
<%
	String cxrq=request.getParameter("cxrq");
	String cxrq2=request.getParameter("cxrq2");
	String hjzs=null;
	int drdds_cg=0;
	int drdds_mm=0;
	int drdds_jj=0;
	int drdds_zc=0;

	int drdds_cg2=0;
	int drdds_mm2=0;
	int drdds_jj2=0;
	int drdds_zc2=0;

	double drssk_cg=0;
	double drssk_mm=0;
	double drssk_jj=0;
	double drssk_zc=0;

	double drssk_cg2=0;
	double drssk_mm2=0;
	double drssk_jj2=0;
	double drssk_zc2=0;

	int drddhj=0;
	int ljddhj=0;
    double sskhj=0;
	double ljsskhj=0;
	int xzkhs=0;
	String ls_sql=null;

%>
<%
String ddrq=null;
String mmwheresql=null;
String cgwheresql=null;
String jjwheresql=null;
String zcwheresql=null;
String mmwheresql2=null;
String cgwheresql2=null;
String jjwheresql2=null;
String zcwheresql2=null;


		ddrq=request.getParameter("cxrq");
		if (ddrq!=null)
		{
			if (!(ddrq.equals("")))
			{
				mmwheresql="  and (jc_mmydd.lrsj>=TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
				cgwheresql="  and (jc_cgdd.lrsj>=TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
				jjwheresql="  and (jc_jjdd.lrsj>=TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
				zcwheresql="  and (jc_zcdd.lrsj>=TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
				mmwheresql2=" and  (jc_mmydd.lrsj<TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
				cgwheresql2=" and (jc_cgdd.lrsj<TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
				jjwheresql2=" and  (jc_jjdd.lrsj<TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
				zcwheresql2=" and (jc_zcdd.lrsj<TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
			   
			}
		}
		ddrq=request.getParameter("cxrq2");
		if (ddrq!=null)
		{
			if (!(ddrq.equals("")))
			{
				mmwheresql+="  and (jc_mmydd.lrsj<=TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
				cgwheresql+="  and (jc_cgdd.lrsj<=TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
				jjwheresql+="  and (jc_jjdd.lrsj<=TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
				zcwheresql+="  and (jc_zcdd.lrsj<=TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
			}
		}

	
	

	
		ls_sql="SELECT  count(distinct khbh)  FROM";
		ls_sql+=" (";    
		ls_sql+="( select crm_khxx.khbh from jc_mmydd,crm_khxx where crm_khxx.khbh=jc_mmydd.khbh ";//+mmwheresql;
		ls_sql+=mmwheresql;
		ls_sql+=" union all";
		ls_sql+=" select crm_khxx.khbh from jc_cgdd,crm_khxx where crm_khxx.khbh=jc_cgdd.khbh" ;//+cgwheresql;
		ls_sql+=cgwheresql;
		ls_sql+=" union all";
		ls_sql+=" select crm_khxx.khbh from jc_jjdd,crm_khxx where crm_khxx.khbh=jc_jjdd.khbh ";//+jjwheresql;
		ls_sql+=jjwheresql;
		ls_sql+=" union all";
		ls_sql+=" select crm_khxx.khbh from jc_zcdd,crm_khxx where crm_khxx.khbh=jc_zcdd.khbh ";//+zcwheresql;
		ls_sql+=zcwheresql;
		ls_sql+=" ) ";  
		
		ls_sql+="  minus ";
	
		ls_sql+="( select crm_khxx.khbh from jc_mmydd,crm_khxx where crm_khxx.khbh=jc_mmydd.khbh ";//+mmwheresql;
		ls_sql+=mmwheresql2;
		ls_sql+=" union all";
		ls_sql+=" select crm_khxx.khbh from jc_cgdd,crm_khxx where crm_khxx.khbh=jc_cgdd.khbh" ;//+cgwheresql;
		ls_sql+=cgwheresql2;
		ls_sql+=" union all";
		ls_sql+=" select crm_khxx.khbh from jc_jjdd,crm_khxx where crm_khxx.khbh=jc_jjdd.khbh ";//+jjwheresql;
		ls_sql+=jjwheresql2;
		ls_sql+=" union all";
		ls_sql+=" select crm_khxx.khbh from jc_zcdd,crm_khxx where crm_khxx.khbh=jc_zcdd.khbh ";//+zcwheresql;
		ls_sql+=zcwheresql2;
		ls_sql+=" )";    
		ls_sql+=" )";    
//		out.print(ls_sql);
		hjzs=cf.executeQuery(ls_sql);
		xzkhs=Integer.parseInt(hjzs);

		
%>


<%

//计算橱柜当日订单数
ls_sql="select count(*) from jc_cgdd  where jc_cgdd.lrsj=TO_DATE('"+cxrq2+"','YYYY-MM-DD') ";
hjzs=cf.executeQuery(ls_sql);
drdds_cg=Integer.parseInt(hjzs);

//计算橱柜当日累计订单数
ls_sql="select count(*) from jc_cgdd  where jc_cgdd.lrsj<=TO_DATE('"+cxrq2+"','YYYY-MM-DD') and jc_cgdd.lrsj>=TO_DATE('"+cxrq+"','YYYY-MM-DD')";
hjzs=cf.executeQuery(ls_sql);
drdds_cg2=Integer.parseInt(hjzs);

//计算木门当日订单数
ls_sql="select count(*) from jc_mmydd where jc_mmydd.lrsj=TO_DATE('"+cxrq2+"','YYYY-MM-DD') ";
hjzs=cf.executeQuery(ls_sql);
drdds_mm=Integer.parseInt(hjzs);
//计算木门当日累计订单数
ls_sql="select count(*) from jc_mmydd where jc_mmydd.lrsj<=TO_DATE('"+cxrq2+"','YYYY-MM-DD') and jc_mmydd.lrsj>=TO_DATE('"+cxrq+"','YYYY-MM-DD')";
hjzs=cf.executeQuery(ls_sql);
drdds_mm2=Integer.parseInt(hjzs);

//计算家具当日订单数
ls_sql="select count(*) from jc_jjdd  where jc_jjdd.lrsj=TO_DATE('"+cxrq2+"','YYYY-MM-DD') ";
hjzs=cf.executeQuery(ls_sql);
drdds_jj=Integer.parseInt(hjzs);
//计算家具当日累计订单数
ls_sql="select count(*) from jc_jjdd  where jc_jjdd.lrsj<=TO_DATE('"+cxrq2+"','YYYY-MM-DD') and jc_jjdd.lrsj>=TO_DATE('"+cxrq+"','YYYY-MM-DD')";
hjzs=cf.executeQuery(ls_sql);
drdds_jj2=Integer.parseInt(hjzs);

//计算主材当日订单数
ls_sql="select count(*) from jc_zcdd  where jc_zcdd.lrsj=TO_DATE('"+cxrq2+"','YYYY-MM-DD') ";
hjzs=cf.executeQuery(ls_sql);
drdds_zc=Integer.parseInt(hjzs);
//计算主材当日累计订单数
ls_sql="select count(*) from jc_zcdd  where jc_zcdd.lrsj<=TO_DATE('"+cxrq2+"','YYYY-MM-DD') and jc_zcdd.lrsj>=TO_DATE('"+cxrq+"','YYYY-MM-DD')";
hjzs=cf.executeQuery(ls_sql);
drdds_zc2=Integer.parseInt(hjzs);

drddhj=drdds_cg+drdds_mm+drdds_jj+drdds_zc;
ljddhj=drdds_cg2+drdds_mm2+drdds_jj2+drdds_zc2;
//--------------------------------
//开始计算实收款和累计收款
//-------------------------------------

//计算橱柜当日
ls_sql="select sum(htze)+0 from jc_cgdd  where lrsj=TO_DATE('"+cxrq2+"','YYYY-MM-DD') ";
hjzs=cf.executeQuery(ls_sql);
drssk_cg=Double.parseDouble('0'+cf.fillNull(hjzs));
//计算橱柜当日累计
ls_sql="select sum(htze-cgjxje-wjjxje-dqjxje+cgzxje+wjzxje+dqzxje) from jc_cgdd  where lrsj<=TO_DATE('"+cxrq2+"','YYYY-MM-DD') and lrsj>=TO_DATE('"+cxrq+"','YYYY-MM-DD')";
hjzs=cf.executeQuery(ls_sql);
drssk_cg2=Double.parseDouble('0'+cf.fillNull(hjzs));

//计算木门当日
ls_sql="select sum(zjhze) from jc_mmydd  where lrsj=TO_DATE('"+cxrq2+"','YYYY-MM-DD') ";
hjzs=cf.executeQuery(ls_sql);
drssk_mm=Double.parseDouble('0'+cf.fillNull(hjzs));
//计算木门当日累计
ls_sql="select sum(zjhze) from jc_mmydd  where lrsj<=TO_DATE('"+cxrq2+"','YYYY-MM-DD') and lrsj>=TO_DATE('"+cxrq+"','YYYY-MM-DD')";
hjzs=cf.executeQuery(ls_sql);
drssk_mm2=Double.parseDouble('0'+cf.fillNull(hjzs));

//计算家具当日
ls_sql="select sum(htze+zxje-jxje) from jc_jjdd  where lrsj=TO_DATE('"+cxrq2+"','YYYY-MM-DD') ";
hjzs=cf.executeQuery(ls_sql);
drssk_jj=Double.parseDouble('0'+cf.fillNull(hjzs));
//计算家具当日累计
ls_sql="select sum(htze+zxje-jxje) from jc_jjdd  where lrsj<=TO_DATE('"+cxrq2+"','YYYY-MM-DD') and lrsj>=TO_DATE('"+cxrq+"','YYYY-MM-DD')";
hjzs=cf.executeQuery(ls_sql);
drssk_jj2=Double.parseDouble('0'+cf.fillNull(hjzs));


//计算主材当日
ls_sql="select sum(hkze+zjhze) from jc_zcdd  where lrsj=TO_DATE('"+cxrq2+"','YYYY-MM-DD') ";
hjzs=cf.executeQuery(ls_sql);
drssk_zc=Double.parseDouble('0'+cf.fillNull(hjzs));
//计算主材当日累计
ls_sql="select sum(hkze+zjhze) from jc_zcdd  where lrsj<=TO_DATE('"+cxrq2+"','YYYY-MM-DD') and lrsj>=TO_DATE('"+cxrq+"','YYYY-MM-DD')";
hjzs=cf.executeQuery(ls_sql);
drssk_zc2=Double.parseDouble('0'+cf.fillNull(hjzs));
sskhj=drssk_cg+drssk_mm+drssk_jj+drssk_zc;
ljsskhj=drssk_cg2+drssk_mm2+drssk_jj2+drssk_zc2;

%>

 <CENTER>
  <b>家居管理中心报表</b> <br>
  （
  <input  type="hidden"  name="cxrq" value="<%=cxrq2%>">
  <%=cxrq%>---<%=cxrq2%>
  <input  type="hidden"  name="<%=cxrq2%>">
  ） 
  <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
    <td width="20%" > 
      <div align="center"><font face="宋体" size="3">项目名称</font></div>
    </td>
    <td width="20%" > 
      <div align="center"><font face="宋体" size="3">当日订单数量</font></div>
    </td>
    <td width="20%" > 
      <div align="center"><font face="宋体" size="3">当日合同金额</font></div>
    </td>
    <td width="20%" > 
      <div align="center"><font face="宋体" size="3">截止目前总订单</font></div>
    </td>
    <td width="20%" > 
      <div align="center"><font face="宋体" size="3">截止目前总合同金额</font></div>
    </td>
    </tr>
    <tr> 
      <td width="20%" > 
        <div align="center"><font face="宋体" size="3">橱柜</font></div>
      </td>
      <td width="20%" align="center"><%=drdds_cg%>　</td>
      <td width="20%" align="right"><%=drssk_cg%></td>
      <td width="20%" align="center"><%=drdds_cg2%>　</td>
      <td width="20%" align="right"><%=drssk_cg2%></td>
    </tr>
    <tr> 
      <td width="20%" > 
        <div align="center"><font face="宋体" size="3">木门</font></div>
      </td>
      <td width="20%" align="center"><%=drdds_mm%>　</td>
      <td width="20%" align="right"><%=drssk_mm%></td>
      <td width="20%" align="center"><%=drdds_mm2%>　</td>
      <td width="20%" align="right"><%=drssk_mm2%></td>
    </tr>
    <tr> 
      <td width="20%" > 
        <div align="center"><font face="宋体" size="3">家具</font></div>
      </td>
      <td width="20%" align="center"><%=drdds_jj%>　</td>
      <td width="20%" align="right"><%=drssk_jj%></td>
      <td width="20%" align="center"><%=drdds_jj2%>　</td>
      <td width="20%" align="right"><%=drssk_jj2%></td>
    </tr>
    <tr> 
      <td width="20%" > 
        <div align="center"><font face="宋体" size="3">外主材</font></div>
      </td>
      <td width="20%" align="center"><%=drdds_zc%>　</td>
      <td width="20%" align="right"><%=drssk_zc%></td>
      <td width="20%" align="center"><%=drdds_zc2%>　</td>
      <td width="20%" align="right"><%=drssk_zc2%></td>
    </tr>
    <tr> 
      <td width="20%" > 
        <div align="center"><font face="宋体" size="3">合计（元）</font></div>
      </td>
      <td width="20%" align="center"><%=drddhj%>　</td>
      <td width="20%" align="right"><%=sskhj%></td>
      <td width="20%" align="center"><%=ljddhj%>　</td>
      <td width="20%" align="right"><%=ljsskhj%></td>
    </tr>
  </table>
</CENTER>
<p><font size="3">　新增客户数量<!-- (以前未定过任何集成产品) -->：
<A HREF="xzkhList.jsp?cxrq=<%=cxrq%>&cxrq2=<%=cxrq2%>"><%=xzkhs%></A></font></p>
<p>　</p>
<p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
<%=zgsmc%>家居管理中心</p>

</body>
</html>
