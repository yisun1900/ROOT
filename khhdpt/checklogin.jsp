<%
	String getsession=(String)session.getAttribute("yhdlm");
	if (getsession==null)
	{
		out.print(new String("ϵͳ����ʱ������������µ�¼��".getBytes("8859_1")));
		return;
	}
%>
