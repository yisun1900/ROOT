<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>期末结转</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">

<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#CCCCCC"  align="center">

	<td  width="7%">结转期数</td>
	<td  width="10%">业绩结转时间</td>
	<td  width="7%">结转人</td>
	<td  width="17%">操作时间</td>
	<td  width="10%">上期结转日期</td>
	<td  width="7%">签约客户总数</td>
	<td  width="14%">签约总额</td>
	<td  width="7%">退单客户总数</td>
	<td  width="14%">退单总额</td>
	<td  width="14%">业绩总额</td>
	
</tr>


<%
	String dwbh=request.getParameter("dwbh");
	ybl.common.PageObject pageObj=new ybl.common.PageObject();	
	String ls_sql=null;

	ls_sql="SELECT jzqs,TO_CHAR(jzrq,'YYYY-MM-DD') jzrq,jzr,czsj,TO_CHAR(sqjzrq,'YYYY-MM-DD') sqjzrq,khzs,qyze,tdkhzs,NVL(tdqyze,0),qyze-NVL(tdqyze,0)";
	ls_sql+=" FROM cw_qmjz";
	ls_sql+="  where dwbh='"+dwbh+"' ";  
    ls_sql+=" order by jzrq desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(12);//设置每页显示记录数
	pageObj.setDateType("long");

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"jzrq"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCw_qmjz.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("jzrq",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%>
</table>

  <table width="100%" border="1" cellpadding="1" cellspacing="0" style='FONT-SIZE: 14px'>
        <tr>
          <td height="42" colspan="2" align="center">未结转业绩</td>
        </tr>
<%

Connection conn=null;
PreparedStatement ps=null; 
ResultSet rs=null;

try {
	conn=cf.getConnection();

	int count=0;
	int curNian=0;
	int curYue=0;
	int curRi=0;
	int curHH=0;
	int ret=0;

		
	//获取规定结转日期
	ls_sql="select TO_CHAR(SYSDATE,'YYYY') nian,TO_CHAR(SYSDATE,'MM') yue,TO_CHAR(SYSDATE,'DD') ri,TO_CHAR(SYSDATE,'HH24') hh";
	ls_sql+="  from sq_yjjzsj";  
	ls_sql+="  where dwbh='"+dwbh+"' ";  
	ps=conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	if (rs.next())
	{
		curNian=rs.getInt("nian");//当前年
		curYue=rs.getInt("yue");//当前月份
		curRi=rs.getInt("ri");//当前日期
		curHH=rs.getInt("hh");//当前小时
	} 
	rs.close();
	ps.close();


	//判断是否有结转记录
	ls_sql="select count(*) ";
	ls_sql+=" from cw_qmjz";  
	ls_sql+=" where dwbh='"+dwbh+"'";  
	ps=conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	} 
	rs.close();
	ps.close();

	if (count==0)//没有结转记录，只需结转当月
	{
		int jzrq=0;//结转日期
		int jzsj=0;//结转时间
		ls_sql="select jzrq,jzsj";
		ls_sql+="  from sq_yjjzsj";  
		ls_sql+="  where dwbh='"+dwbh+"'";  
		ps=conn.prepareStatement(ls_sql);  
		rs=ps.executeQuery();
		while (rs.next())
		{
			jzrq=rs.getInt("jzrq");//结转日期
			jzsj=rs.getInt("jzsj");//结转时间
			
			%>
			<tr>
			  <td align="right">结转时间：</td>
			  <td>
				<%=curNian%>年<%=cf.addZero(curYue,2)%>月<%=cf.addZero(jzrq,2)%>日<%=jzsj%>时
				<input type="hidden" name="nian" value="<%=curNian%>"  >
				<input type="hidden" name="yue" value="<%=cf.addZero(curYue,2)%>"  >
				<input type="hidden" name="rq" value="<%=cf.addZero(jzrq,2)%>"  >
				<input type="hidden" name="sj" value="<%=jzsj%>"  >
			</td>
			</tr>
			<%
		} 
		rs.close();
		ps.close();
	}
	else{
		//上期结转日期
		String sqjzrq="";
		ls_sql="select max(jzrq)";
		ls_sql+=" from cw_qmjz";  
		ls_sql+=" where dwbh=? ";  
		ps=conn.prepareStatement(ls_sql);  
		ps.setString(1,dwbh);
		rs=ps.executeQuery();
		if (rs.next())
		{
			sqjzrq=cf.fillNull(rs.getDate(1));
		} 
		rs.close();
		ps.close();

		int priNian=Integer.parseInt(sqjzrq.substring(0,4));//上期年
		int priYue=Integer.parseInt(sqjzrq.substring(5,7));//上期月
		int priRi=Integer.parseInt(sqjzrq.substring(8,10));//上期日


		
		for (int i=priNian;i<=curNian ;i++ )
		{
			for (int j=1;j<=12 ;j++ )
			{
				int jzrq=0;//结转日期
				int jzsj=0;//结转时间
				ls_sql="select jzrq,jzsj";
				ls_sql+="  from sq_yjjzsj";  
				ls_sql+="  where dwbh='"+dwbh+"'";  
				ls_sql+="  order by jzrq ";  
				ps=conn.prepareStatement(ls_sql);  
				rs=ps.executeQuery();
				while (rs.next())
				{
					jzrq=rs.getInt("jzrq");//结转日期
					jzsj=rs.getInt("jzsj");//结转时间

					if (i==priNian)//第一年
					{
						if (j<priYue)
						{
							continue;
						}
					}
					if (i==priNian && j==priYue)//第一年，第一月
					{
						if (priRi>=jzrq)
						{
							continue;
						}
					}

					if (i==curNian)//最后一年
					{
						if (j>curYue)
						{
							continue;
						}
					}

					if (i==curNian && j==curYue)//最后年，最后月
					{
						if (curRi<jzrq)
						{
							continue;
						}

						if (curRi==jzrq && curHH<jzsj)
						{
							continue;
						}
					}

					%>
					<tr>
					  <td align="right">结转时间：</td>
					  <td>
						<%=i%>年<%=cf.addZero(j,2)%>月<%=cf.addZero(jzrq,2)%>日<%=jzsj%>时	
						<input type="hidden" name="nian" value="<%=i%>"  >
						<input type="hidden" name="yue" value="<%=cf.addZero(j,2)%>"  >
						<input type="hidden" name="rq" value="<%=cf.addZero(jzrq,2)%>"  >
						<input type="hidden" name="sj" value="<%=jzsj%>"  >
					  </td>
					</tr>
					<%

				} 
				rs.close();
				ps.close();
			}
		}

	}

}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
    <tr align="center"> 
      <td height="55" colspan="2"> 
	<input type="hidden" name="dwbh" value="<%=dwbh%>"  >
      <input type="button"  value="业绩结转" onClick="f_do(selectform)">      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{

	FormName.action="yjqmjz.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
