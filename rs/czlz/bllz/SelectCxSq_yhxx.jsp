<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%	
	//检查是否做期末结转
	//返回： -1:出错;0:当月已结转；1:上月已结转，当月未结转;2:上月未结转 
	int count=cf.checkQmjz("rs_ydjz",cf.today());

	if (count==2)
	{
		out.println("上月没有进行『结转』！");
		return;
	}
	else if (count==-1)
	{
		out.println("出错！");
		return;
	}

%>

<body bgcolor="#FFFFFF">
  <div align="center"> 
    <p>选择离职类型 </p>
    <table width="100%" border="0">
      <tr> 
        
      <td width="43%" height="112">&nbsp;</td>
        
      <td width="57%" height="112"> 
        <p><A HREF="SelectCxRs_czsq.jsp">需要辞职申请</A> </p>
        <p><A HREF="SelectCxSq_yhxx1.jsp">不需要辞职申请</A> </p>
      </td>
      </tr>
    </table>
  </div>
</body>
</html>


