<%
	if (cf.check(request,session)==0)
	{
		out.print(new String("系统闲置时间过长，请重新登录！".getBytes("8859_1")));
		return;
	}
%>
