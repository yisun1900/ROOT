<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>统计报表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
body {
	background-color: #FFF;
}
td{
white-space:nowrap;
}
</style>
</head>
<%
	String dwbh=(String)session.getAttribute("dwbh");
	String ygbh=(String)session.getAttribute("ygbh");
	String sjsbh=(String)session.getAttribute("sjsbh");
	String kfgssq=(String)session.getAttribute("kfgssq");
	String yhmc=(String)session.getAttribute("yhmc");
	String yhjs=(String)session.getAttribute("yhjs");
	String zwbm=(String)session.getAttribute("zwbm");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx in ('F2','F1') order by ssdw,dwbh");
	Calendar cal=Calendar.getInstance();
	int year=cal.get(Calendar.YEAR);
%>

<body>
<form method="post" action="" name="selectform" target="_blank">
 <table width="997" border="0" style="FONT-SIZE:12; font-weight: bold;" bgcolor="#CCFFFF" cellpadding="1" cellspacing="8">
     <tr bgcolor="#FFFFFF"> 
      <td height="48"  colspan="11" bgcolor="#008080"> 
       <div align="center" style="font-size:24px; color: #FFF; font-weight: bold;">
         <DIV align="center"><strong>投诉原因分析</strong></DIV>
       </div>      </td>
    </tr>
	<tr bgcolor="#FFFFCC">  
	 <td width="10%" bordercolor="#000000" align="center"   bgcolor="#99CC00"><span style="border:#000000; border:thin">公&nbsp;&nbsp;&nbsp;司</span></td>
      <td width="6%" align="center" bgcolor="#00CC99"   >分公司</td>
      <td align="center" width="12%"  bgcolor="#FFFFFF" > 
        <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:120PX" onChange="change1('ssfgs')">
          	<%
			if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
			{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
			}
			else{
				out.println("错误！未进行客户资料授权，请联系系统管理员");
				return;
			}
		%>  
       </select>      </td>
	   <td width="8%" align="center" bgcolor="#99CC00">时&nbsp;&nbsp;&nbsp;间</td>
	   <td width="6%" align="center" bgcolor="#00CC99">统计年份</td>
      <td align="center" width="12%"  bgcolor="#FFFFFF" >  
        <select name="year" style="FONT-SIZE:12PX;WIDTH:120PX"  >
                  <option value=""></option>
				  <%
				  cf.selectItem(out,"select distinct to_char(qyrq,'YYYY'),to_char(qyrq,'YYYY') from crm_khxx where to_char(qyrq,'YYYY') is not null  order by to_char(qyrq,'YYYY')",""+year+"");
				  
				  %>
        </select>      </td>
	  </tr>
	  <tr bgcolor="#FFFFCC">
	    <td width="6%" align="center" bgcolor="#99CC00"   >信息来源</td>
		<td width="6%" align="center" bgcolor="#00CC99">部&nbsp;&nbsp;&nbsp;&nbsp;门</td>
		<td align="center" width="12%"  bgcolor="#FFFFFF" > 
		<select name="dwbh1" style="FONT-SIZE:12PX;WIDTH:120PX"  onChange="getThis1('dwbh1')">
          <%
			if (kfgssq.equals("2") || kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
			}
			else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+ssfgs+"' and dwflbm in ('07','11') order by dwbh","");
			}
			else{
				out.println("错误！未进行客户资料授权，请联系系统管理员");
				return;
			}
			%>  
        </select>	   </td>
		<td width="6%" align="center" bgcolor="#00CC99">部门小组</td>
      <td align="center" width="12%"  bgcolor="#FFFFFF" >  
        <select name="sjsbh1" style="FONT-SIZE:12PX;WIDTH:120PX" onChange="dos1('ygbh1')">
         <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		//cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in ('F3','F4') order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in ('F3','F4') and dwflbm in ('07','11') and ssfgs='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2")||yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in ('F3','F4') and dwflbm in ('07','11') and ssdw='"+dwbh+"' order by dwbh ","");
	}
	else if (yhjs.equals("F3")||yhjs.equals("F4"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where  dwbh='"+sjsbh+"' order by dwbh ","");
	}
 %>
        </select>      </td>
		<td width="6%" align="center" bgcolor="#00CC99">员&nbsp;&nbsp;&nbsp;&nbsp;工</td>
      <td align="center" width="12%"  bgcolor="#FFFFFF" ><select name="ygbh1" style="FONT-SIZE:12PX;WIDTH:120PX"  >
          <%
			if (kfgssq.equals("2") || kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select ygbh,yhmc from sq_yhxx   order by ygbh","");
			}
			else if (kfgssq.equals("1") )
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select ygbh,yhmc from sq_yhxx where  ssfgs='"+ssfgs+"' order by ygbh","");
			}
			else if (kfgssq.equals("3"))
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select ygbh,yhmc from sq_yhxx where dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') order by ygbh ","");
			}
			else if (kfgssq.equals("4"))
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select ygbh,yhmc from sq_yhxx where dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') order by ygbh ","");
			}
			else if (yhjs.equals("F3")||yhjs.equals("F4")&&!zwbm.equals("19")&&!zwbm.equals("04"))
			{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select ygbh,yhmc from sq_yhxx where  sjsbh='"+sjsbh+"' order by ygbh ","");
			}
			else if (zwbm.equals("19")||zwbm.equals("04"))
			{
		
			cf.selectItem(out,"select ygbh,yhmc from sq_yhxx where  yhmc='"+yhmc+"' order by ygbh ","");
			}
			else{
				out.println("错误！未进行客户资料授权，请联系系统管理员");
				return;
			}
			%>
          
	
	
%>
        </select>
      </td>
    </tr>
	
	<tr bgcolor="#FFFFCC">
	    <td width="6%" align="center" bgcolor="#99CC00"   >信息消化</td>
		<td width="6%" align="center" bgcolor="#00CC99">部&nbsp;&nbsp;&nbsp;&nbsp;门</td>
		<td align="center" width="12%"  bgcolor="#FFFFFF" > 
		<select name="dwbh2" style="FONT-SIZE:12PX;WIDTH:120PX"  onChange="getThis2('dwbh2')">
          <%
			if (kfgssq.equals("2") || kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
			}
			else if (kfgssq.equals("1") )
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
			}
			else if (kfgssq.equals("3"))
			{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') ","");
			}
			else if (kfgssq.equals("4"))
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') order by dwbh ","");
			}
			else{
				out.println("错误！未进行客户资料授权，请联系系统管理员");
				return;
			}
			%>  
        </select>	   </td>
		<td width="6%" align="center" bgcolor="#00CC99">部门小组</td>
      <td align="center" width="12%"  bgcolor="#FFFFFF" >  
        <select name="sjsbh2" style="FONT-SIZE:12PX;WIDTH:120PX" >
         <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		//cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in ('F3','F4') order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in ('F3','F4') and dwflbm='11' and ssfgs='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2")||yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in ('F3','F4') and dwflbm='11' and ssdw='"+dwbh+"' order by dwbh ","");
	}
	else if (yhjs.equals("F3")||yhjs.equals("F4"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where  dwbh='"+sjsbh+"' order by dwbh ","");
	}
 %>
        </select>      </td>
	<td width="6%" align="center" bgcolor="#00CC99">员&nbsp;&nbsp;&nbsp;&nbsp;工</td>
      <td align="center" width="12%"  bgcolor="#FFFFFF" ><select name="ygbh2" style="FONT-SIZE:12PX;WIDTH:120PX"  >
          <%
			if (kfgssq.equals("2") || kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select ygbh,yhmc from sq_yhxx   order by ygbh","");
			}
			else if (kfgssq.equals("1") )
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select ygbh,yhmc from sq_yhxx where  ssfgs='"+ssfgs+"' order by ygbh","");
			}
			else if (kfgssq.equals("3"))
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select ygbh,yhmc from sq_yhxx where dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') order by ygbh ","");
			}
			else if (kfgssq.equals("4"))
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select ygbh,yhmc from sq_yhxx where dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') order by ygbh ","");
			}
			else if (yhjs.equals("F3")||yhjs.equals("F4")&&!zwbm.equals("04"))
			{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select ygbh,yhmc from sq_yhxx where  sjsbh='"+sjsbh+"' order by ygbh ","");
			}
			else if (zwbm.equals("04"))
			{
		
			cf.selectItem(out,"select ygbh,yhmc from sq_yhxx where  yhmc='"+yhmc+"' order by ygbh ","");
			}
			else{
				out.println("错误！未进行客户资料授权，请联系系统管理员");
				return;
			}
			%>
          
	
	
%>
        </select>
      </td>
    </tr>
     <tr bgcolor="#FFFFCC">  
	 <td width="6%" align="center" bgcolor="#99CC00"   >权限控制</td>
      <td width="6%" align="center" bgcolor="#00CC99"   >分公司</td>
      <td align="center" width="12%"  bgcolor="#FFFFFF" > 
        <select name="fgs" style="FONT-SIZE:12PX;WIDTH:120PX" onChange="change('fgs')">
          	<%
			if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
			{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
			}
			else{
				out.println("错误！未进行客户资料授权，请联系系统管理员");
				return;
			}
		%>  
       </select>      </td>
		<td width="6%" align="center" bgcolor="#00CC99">部&nbsp;&nbsp;&nbsp;&nbsp;门</td>
		<td align="center" width="12%"  bgcolor="#FFFFFF" > 
		<select name="dwbh" style="FONT-SIZE:12PX;WIDTH:120PX"  onChange="getThis('sjsbh')">
          <%
			if (kfgssq.equals("2") || kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
			}
			else if (kfgssq.equals("1") )
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
			}
			else if (kfgssq.equals("3"))
			{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') ","");
			}
			else if (kfgssq.equals("4"))
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') order by dwbh ","");
			}
			else{
				out.println("错误！未进行客户资料授权，请联系系统管理员");
				return;
			}
			%>  
        </select>
		
	   </td>
		<td width="6%" align="center" bgcolor="#00CC99">部门小组</td>
      <td align="center" width="12%"  bgcolor="#FFFFFF" >  
        <select name="sjsbh" style="FONT-SIZE:12PX;WIDTH:120PX" onChange="dos('ygbh')">
         <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		//cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in ('F3','F4') order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in ('F3','F4') and ssfgs='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2")||yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in ('F3','F4') and ssdw='"+dwbh+"' order by dwbh ","");
	}
	else if (yhjs.equals("F3")||yhjs.equals("F4"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where  dwbh='"+sjsbh+"' order by dwbh ","");
	}
 %>
        </select>
      </td>
	  <td width="6%" align="center" bgcolor="#00CC99">员&nbsp;&nbsp;&nbsp;&nbsp;工</td>
      <td align="center" width="12%"  bgcolor="#FFFFFF" >  
        <select name="ygbh" style="FONT-SIZE:12PX;WIDTH:120PX"  >
		<%
			if (kfgssq.equals("2") || kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select ygbh,yhmc from sq_yhxx   order by ygbh","");
			}
			else if (kfgssq.equals("1") )
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select ygbh,yhmc from sq_yhxx where  ssfgs='"+ssfgs+"' order by ygbh","");
			}
			else if (kfgssq.equals("3"))
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select ygbh,yhmc from sq_yhxx where dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') order by ygbh ","");
			}
			else if (kfgssq.equals("4"))
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select ygbh,yhmc from sq_yhxx where dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') order by ygbh ","");
			}
			else if (yhjs.equals("F3")||yhjs.equals("F4")&&!zwbm.equals("19")&&!zwbm.equals("04"))
			{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select ygbh,yhmc from sq_yhxx where  sjsbh='"+sjsbh+"' order by ygbh ","");
			}
			else if (zwbm.equals("19")||zwbm.equals("04"))
			{
		
			cf.selectItem(out,"select ygbh,yhmc from sq_yhxx where  yhmc='"+yhmc+"' order by ygbh ","");
			}
			else{
				out.println("错误！未进行客户资料授权，请联系系统管理员");
				return;
			}
			%>  
	
	
%> 
        </select>
      </td>
	  
    </tr>
   <tr bgcolor="#FFFFCC"> 
    <td align="center" bgcolor="#99CC00">信息类别</td>
   <td align="center" bgcolor="#00CC99">渠&nbsp;&nbsp;道</td>
      <td align="center" bgcolor="#FFFFFF"> 
        <select name="xxlybm" style="FONT-SIZE:12PX;WIDTH:120PX"  >
                  <option value=""></option>
				  <%
				  cf.selectItem(out,"select xxlybm,xxlymc from dm_xxlybm   order by xxlybm","");
				  
				  %>
        </select>
      </td>
	  <td align="center" bgcolor="#00CC99">户&nbsp;&nbsp;&nbsp;&nbsp;型</td>
       <td align="center" bgcolor="#FFFFFF"> 
        <select name="hxbm" style="FONT-SIZE:12PX;WIDTH:120PX"  >
                  <option value=""></option>
				  <%
				  cf.selectItem(out,"select hxbm,hxmc from dm_hxbm   order by hxbm","");
				  
				  %>
        </select>
      </td>
	  <td align="center" bgcolor="#00CC99">面积区间</td>
       <td align="center" bgcolor="#FFFFFF"> 
        <select name="hxmjbm" style="FONT-SIZE:12PX;WIDTH:120PX"  >
                  <option value=""></option>
				  <%
				  cf.selectItem(out,"select hxmjbm,hxmjmc from dm_hxmjbm order by hxmjbm","");
				  
				  %>
        </select>
      </td>
	  <td align="center" bgcolor="#00CC99">价格区间</td>
       <td align="center" bgcolor="#FFFFFF"> 
        <select name="zxjwbm" style="FONT-SIZE:12PX;WIDTH:120PX"  >
                  <option value=""></option>
				  <%
				  cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm  order by zxjwbm","");
				  
				  %>
        </select>
      </td>
    </tr>
	<tr bgcolor="#FFFFCC"> 
	<td align="center" bgcolor="#CCFFFF">&nbsp;</td>
	<td align="center" bgcolor="#00CC99">城&nbsp;&nbsp;&nbsp;&nbsp;区</td>
       <td align="center" bgcolor="#FFFFFF"> 
        <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:120PX"  >
		<%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm","");
	}
	else
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select distinct dm_cqbm.cqbm,dm_cqbm.cqmc from dm_cqbm,sq_dwxx where sq_dwxx.dqbm=dm_cqbm.dqbm and  ssfgs='"+ssfgs+"' order by dm_cqbm.cqbm","");
	}
%> 
        </select>
      </td>
   <td align="center" bgcolor="#00CC99">小&nbsp;&nbsp;区</td>
       <td align="center" bgcolor="#FFFFFF"> 
        <select name="xqbm" style="FONT-SIZE:12PX;WIDTH:120PX"  >
		<%
			if (kfgssq.equals("2") || kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select distinct xqbm,xqbm from crm_zxkhxx where xqbm is not null ","");
			}
			else if (kfgssq.equals("1") )
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select distinct xqbm,xqbm from crm_zxkhxx where ssfgs='"+ssfgs+"' and  xqbm is not null ","");
			}
			else if (kfgssq.equals("3"))
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select distinct xqbm,xqbm from crm_zxkhxx where ssfgs='"+ssfgs+"' and zxdm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') ","");
			}
			else if (kfgssq.equals("4"))
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select distinct xqbm,xqbm from crm_zxkhxx where ssfgs='"+ssfgs+"' and zxdm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') ","");
			}
			else if (yhjs.equals("F3")||yhjs.equals("F4")&&!zwbm.equals("19")&&!zwbm.equals("04"))
			{
			cf.selectItem(out,"select distinct xqbm,xqbm from crm_zxkhxx where ssfgs='"+ssfgs+"' and ywyssxz='"+sjsbh+"'   xqbm is not null ","");
			}
			else if (zwbm.equals("19")||zwbm.equals("04"))
			{
			cf.selectItem(out,"select distinct xqbm,xqbm from crm_zxkhxx where ssfgs='"+ssfgs+"' and (ywy='"+yhmc+"' or sjs='"+yhmc+"' )   xqbm is not null  ","");
			}
			else{
				out.println("错误！未进行客户资料授权，请联系系统管理员");
				return;
			}
			%>  
		
        </select>
      </td>
	  <td align="center" bgcolor="#00CC99">风&nbsp;&nbsp;&nbsp;&nbsp;格</td>
       <td align="center" bgcolor="#FFFFFF"> 
        <select name="fgflbm" style="FONT-SIZE:12PX;WIDTH:120PX"  >
                  <option value=""></option>
				  <%
				  cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm   order by fgflbm","");
				  
				  %>
        </select>
      </td>
	  <td align="center" bgcolor="#00CC99">业主职业</td>
       <td align="center" bgcolor="#FFFFFF"> 
        <select name="zybm" style="FONT-SIZE:12PX;WIDTH:120PX"  >
                  <option value=""></option>
				  <%
				  cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm","");
				  
				  %>
        </select>
      </td>
	  <td align="center" bgcolor="#00CC99">业主年龄</td>
       <td align="center" bgcolor="#FFFFFF"> 
        <select name="nlqjbm" style="FONT-SIZE:12PX;WIDTH:120PX"  >
                  <option value=""></option>
				  <%
				  cf.selectItem(out,"select nlqjbm,nlqjmc from dm_nlqjbm  order by nlqjbm","");
				  
				  %>
        </select>
      </td>
	  
      
    </tr>
    <tr bgcolor="#CCFFFF"> 
	<td  align="center" bgcolor="#99CC00" nowrap="nowrap">报表类别</td>
     <td colspan="1" align="center" bgcolor="#66FFFF">周&nbsp;&nbsp;&nbsp;&nbsp;期</td>
	 <td colspan="3"><input name="tj" type="radio" value="2" checked>月报表</td>
      <td align="center" colspan="1"  bgcolor="#66FFFF" >显示风格</td>
      <td colspan="3" > 
        <input type="radio" name="xsfg" value="1" checked>
        网页 
        <input type="radio" name="xsfg" value="2">
      EXCEL </td>	 
    </tr>
    <tr align="center" bgcolor="#FFFFFF"> 
      <td colspan="10" bgcolor="#CCFFFF"> 
        <input type="button"  value="统计" onClick="f_do(selectform)">
        <input type="reset"  value="重输">      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >

<%
	//启用Ajax
	cf.ajax(out);
%>
<!--

function change1(lx){

	fieldName=lx;

	if (selectform.ssfgs.value=="")
	{
		selectform.ssfgs.focus();
		alert("请首先选择【分公司】");
		return;
	}
	
	if (lx=="ssfgs")
	{
			
			var sql="select dwbh,dwmc from sq_dwxx where dwlx in ('F2','F1') and  cxbz='N' and dwflbm in ('07','11') and ssdw='"+selectform.ssfgs.value+"' order by dwbh";
			var sql1="select dwbh,dwmc from sq_dwxx where dwlx in ('F2','F1') and  cxbz='N'  and dwflbm='11'  and ssdw='"+selectform.ssfgs.value+"' order by dwbh";
			var sql2="select yhmc,yhmc from sq_yhxx where  ssfgs='"+selectform.ssfgs.value+"' and  zwbm in ('04','19') and sfzszg in ('Y','N') ";
			var sql3="select yhmc,yhmc from sq_yhxx where  ssfgs='"+selectform.ssfgs.value+"' and  zwbm='04' and sfzszg in ('Y','N') ";
			var actionStr="/ajax/selectstrs.jsp?sql="+sql+"&sql1="+sql1+"&sql2="+sql2+"&sql3="+sql3;
			//window.open(actionStr);
			openAjax(actionStr);
	}


}

function getThis1(lx)
{
	var sql;

	fieldName=lx;
	

	if (selectform.ssfgs.value=="")
	{
		selectform.ssfgs.focus();
		alert("请首先选择【分公司】");
		return;
	}

	if (lx=="dwbh1")
	{
			if (selectform.dwbh1.value=="")
			{
				selectform.dwbh1.focus();
				alert("请首先选择【部门】");
				return;
			}

			var sql="select dwbh,dwmc from sq_dwxx where dwlx in ('F3','F4') and dwflbm in ('07','11') and  cxbz='N' and ssdw='"+selectform.dwbh1.value+"' order by dwbh";
			var sql1="select yhmc,yhmc from sq_yhxx where  dwbh='"+selectform.dwbh1.value+"' and  zwbm in ('04','19') and sfzszg in ('Y','N') ";
			var actionStr="/ajax/selectstrs.jsp?sql="+sql+"&sql1="+sql1;
			//window.open(actionStr);
			openAjax(actionStr);
	}

}

function getThis2(lx)
{
	var sql;

	fieldName=lx;
	

	if (selectform.ssfgs.value=="")
	{
		selectform.ssfgs.focus();
		alert("请首先选择【分公司】");
		return;
	}

	if (lx=="dwbh2")
	{
			if (selectform.dwbh2.value=="")
			{
				selectform.dwbh2.focus();
				alert("请首先选择【部门】");
				return;
			}

			var sql="select dwbh,dwmc from sq_dwxx where dwlx in ('F3','F4') and dwflbm='11' and  cxbz='N' and ssdw='"+selectform.dwbh2.value+"' order by dwbh";
			var sql1="select yhmc,yhmc from sq_yhxx where  dwbh='"+selectform.dwbh2.value+"' and  zwbm='04' and sfzszg in ('Y','N') ";
			var actionStr="/ajax/selectstrs.jsp?sql="+sql+"&sql1="+sql1;
			//window.open(actionStr);
			openAjax(actionStr);
	}

}
function dos1(lx)
{
	var sql;

	fieldName=lx;
	
		if (lx=="ygbh1")
		{
			if (selectform.dwbh1.value=="")
			{
				selectform.dwbh1.focus();
				alert("请首先选择【部门】");
				return;
			}

			var sql="select yhmc,yhmc from sq_yhxx where  dwbh='"+selectform.dwbh1.value+"' and sfzszg in ('Y','N') and sjsbh='"+selectform.sjsbh1.value+"' ";
			var actionStr="/ajax/selectstrs.jsp?sql="+sql;
			//window.open(actionStr);
			openAjax(actionStr);

		}
	
}


function change(lx){

	fieldName=lx;

	if (selectform.fgs.value=="")
	{
		selectform.fgs.focus();
		alert("请首先选择【分公司】");
		return;
	}
	
	if (lx=="fgs")
	{
			
			var sql="select dwbh,dwmc from sq_dwxx where dwlx in ('F2','F1') and  cxbz='N' and ssdw='"+selectform.fgs.value+"' order by dwbh";
			var sql1="select yhmc,yhmc from sq_yhxx where  ssfgs='"+selectform.fgs.value+"' and sfzszg in ('Y','N') ";
			var sql2="select dm_cqbm.cqbm,dm_cqbm.cqmc from dm_cqbm,sq_dwxx where dm_cqbm.dqbm=sq_dwxx.dqbm and dwbh='"+selectform.fgs.value+"' ";
			var sql3="select distinct xqbm,xqbm from crm_zxkhxx where ssfgs='"+selectform.fgs.value+"' and   xqbm is not null ";
			var actionStr="/ajax/selectstrs.jsp?sql="+sql+"&sql1="+sql1+"&sql2="+sql2+"&sql3="+sql3;
			//window.open(actionStr);
			openAjax(actionStr);
	}


}




function getThis(lx)
{
	var sql;
	var sjsbhMark=0;

	fieldName=lx;
	

	if (selectform.fgs.value=="")
	{
		selectform.fgs.focus();
		alert("请首先选择【分公司】");
		return;
	}

	if (lx=="sjsbh")
	{
		if (sjsbhMark==0)
		{
			if (selectform.dwbh.value=="")
			{
				sjsbhMark=0;
				selectform.dwbh.focus();
				alert("请首先选择【部门】");
				return;
			}

			var sql="select dwbh,dwmc from sq_dwxx where dwlx in ('F3','F4','F5') and  cxbz='N' and ssdw='"+selectform.dwbh.value+"' order by dwbh";
			var sql1="select yhmc,yhmc from sq_yhxx where  dwbh='"+selectform.dwbh.value+"' and sfzszg in ('Y','N') ";
			var sql2="select distinct xqbm,xqbm from crm_zxkhxx where ssfgs='"+selectform.fgs.value+"' and  (ywybm='"+selectform.dwbh.value+"' or zxdm='"+selectform.dwbh.value+"')  and  xqbm is not null";
			var actionStr="/ajax/selectstrs.jsp?sql="+sql+"&sql1="+sql1+"&sql2="+sql2;
			//window.open(actionStr);
			openAjax(actionStr);
			sjsbhMark=1;
		}
	}

}

function dos(lx)
{
	var sql;

	fieldName=lx;
	
		if (lx=="ygbh")
		{
			if (selectform.dwbh.value=="")
			{
				sjsbhMark=0;
				selectform.dwbh.focus();
				alert("请首先选择【部门】");
				return;
			}

			var sql="select yhmc,yhmc from sq_yhxx where  dwbh='"+selectform.dwbh.value+"' and sfzszg in ('Y','N') and sjsbh='"+selectform.sjsbh.value+"' ";
			var sql1="select distinct xqbm,xqbm from crm_zxkhxx where ssfgs='"+selectform.fgs.value+"' and  ywyssxz='"+selectform.sjsbh.value+"' and  xqbm is not null";
			var actionStr="/ajax/selectstrs.jsp?sql="+sql+"&sql1="+sql1;
			//window.open(actionStr);
			openAjax(actionStr);

		}
	
}
function getAjax(ajaxRetStr) 
{
	if (fieldName=="ssfgs")
	{
		var value1=getStrValue(ajaxRetStr,1);
		selectform.dwbh1.length=0;	
		strToSelect(selectform.dwbh1,value1);
		var value2=getStrValue(ajaxRetStr,2);
		selectform.dwbh2.length=0;		
		strToSelect(selectform.dwbh2,value2);
		var value3=getStrValue(ajaxRetStr,3);
		selectform.ygbh1.length=0;		
		strToSelect(selectform.ygbh1,value3);
		var value4=getStrValue(ajaxRetStr,4);
		selectform.ygbh2.length=0;		
		strToSelect(selectform.ygbh2,value4);
	}
	
	if (fieldName=="dwbh1")
	{
		var value1=getStrValue(ajaxRetStr,1);
		selectform.sjsbh1.length=0;	
		strToSelect(selectform.sjsbh1,value1);
		var value2=getStrValue(ajaxRetStr,2);
		selectform.ygbh1.length=0;	
		strToSelect(selectform.ygbh1,value2);
	}
	
	if (fieldName=="dwbh2")
	{
		var value1=getStrValue(ajaxRetStr,1);
		selectform.sjsbh2.length=0;	
		strToSelect(selectform.sjsbh2,value1);
		var value2=getStrValue(ajaxRetStr,2);
		selectform.ygbh2.length=0;	
		strToSelect(selectform.ygbh2,value2);
	}
	if (fieldName=="ygbh1")
	{
		var value1=getStrValue(ajaxRetStr,1);
		selectform.ygbh1.length=0;	
		strToSelect(selectform.ygbh1,value1);
	}
	if (fieldName=="fgs")
	{
		var value1=getStrValue(ajaxRetStr,1);
		selectform.dwbh.length=0;	
		strToSelect(selectform.dwbh,value1);
		var value2=getStrValue(ajaxRetStr,2);
		selectform.ygbh.length=0;		
		strToSelect(selectform.ygbh,value2);
		var value3=getStrValue(ajaxRetStr,3);
		selectform.cqbm.length=0;	
		strToSelect(selectform.cqbm,value3);
		var value4=getStrValue(ajaxRetStr,4);	
		selectform.xqbm.length=0;	
		strToSelect(selectform.xqbm,value4);
	}
	if (fieldName=="sjsbh")
	{
		var value1=getStrValue(ajaxRetStr,1);
		selectform.sjsbh.length=0;
		strToSelect(selectform.sjsbh,value1);
		var value2=getStrValue(ajaxRetStr,2);
		selectform.ygbh.length=0;		
		strToSelect(selectform.ygbh,value2);
		var value3=getStrValue(ajaxRetStr,3);
		selectform.xqbm.length=0;		
		strToSelect(selectform.xqbm,value3);
	}
	if (fieldName=="ygbh")
	{
		var value1=getStrValue(ajaxRetStr,1);
		selectform.ygbh.length=0;	
		strToSelect(selectform.ygbh,value1);
		var value2=getStrValue(ajaxRetStr,2);
		selectform.xqbm.length=0;
		strToSelect(selectform.xqbm,value2);
	}
}


function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.year)=="") {
		alert("请选择[年份 ]！");
		FormName.year.focus();
		return false;
	}
	var test;
	var tj = document.getElementsByName('tj');
	for(i=0;i<tj.length;i++){
	if(tj[i].checked){
	test=tj[i].value;
	}
	}
	if(test==1){
	FormName.action="w_khxx.jsp";
	}
	else if(test==2){
	FormName.action="m_khxx.jsp";
	}
	else if(test==3){
	FormName.action="d_khxx.jsp";
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
