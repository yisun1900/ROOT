<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
</head>

<%
String khbh=request.getParameter("khbh");

if (khbh.equals(""))
{
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String bgcolor="";
String slstr=null;

int row=0;

String xh=null;
String xmbh=null;
String dqbm=null;
String xmmc=null;
String jldwmc=null;
String jgwzbm=null;
String jgwzmc=null;
String bjjbmc=null;
String sfxycl=null;
String bjlx=null;
double dj=0;

int fjsl=0;
String[] fjbm=null;
String[] fjmc=null;
double sl=0;

int allw=433;

try {
	conn=cf.getConnection();
%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
<noscript><iframe scr="*.htm"></iframe></noscript>
<form method="POST" name="listform" action="" target="_blank">
<input type="hidden" name="khbh" value="<%=khbh%>" >

	  <table border="1" cellspacing="0" cellpadding="1" width="100%" height="200" style='FONT-SIZE: 12px'>
        <tr bgcolor="#CCCCCC"  align="center">
          <td width="5%" >&nbsp;</td>
          <td width="6%" >���</td>
          <td width="8%" >������</td>
          <td width="12%" >��Ŀ���</td>
          <td width="30%">��Ŀ����</td>
          <td width="8%" >�Ƿ���Ҫ����</td>
          <td width="8%" >����</td>
          <td width="8%" >������λ</td>
          <td width="8%" >��������</td>
          <td width="7%" >�������ϼ�</td>
        </tr>
        <%
	ls_sql="SELECT xh,xmbh,dqbm,xmmc,DECODE(sfxycl,'1','��Ҫ','2','����Ҫ') sfxycl,jldwmc,dj,bjjbmc,DECODE(bjlx,'1','��׼��Ŀ','2','�Զ���') bjlx";
	ls_sql+=" FROM bj_bjxmmx,jdm_jldwbm,bdm_bjjbbm  ";
    ls_sql+=" where bj_bjxmmx.jldwbm=jdm_jldwbm.jldwbm(+) and bj_bjxmmx.bjjb=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and bj_bjxmmx.khbh='"+khbh+"'";
    ls_sql+=" order by bj_bjxmmx.xmpx,bj_bjxmmx.xh";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		xh=rs.getString("xh");
		xmbh=rs.getString("xmbh");
		dqbm=rs.getString("dqbm");
		xmmc=rs.getString("xmmc");
		sfxycl=rs.getString("sfxycl");
		jldwmc=rs.getString("jldwmc");
		bjjbmc=rs.getString("bjjbmc");
		dj=rs.getDouble("dj");
		bjlx=rs.getString("bjlx");

		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		sl=0;
		ls_sql="SELECT sum(sl)";
		ls_sql+=" FROM bj_gclmx ";
		ls_sql+=" where khbh='"+khbh+"' and dqbm='"+dqbm+"' and xmbh='"+xmbh+"'";
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
			slstr="&nbsp;";
		}
		else{
			slstr=cf.doubleTrimStr(sl,2);
		}

		row++;

		//���ÿ������
		%>
        <tr bgcolor="<%=bgcolor%>" align="center">
          <td ><input name="xhbox" type="checkbox" value="<%=xh%>">
              <input name="xh" type="hidden" value="<%=xh%>">          </td>
          <td ><%=row%></td>
          <td align="center" ><a href="#" onclick=window.open('LrFjGcl1.jsp?khbh=<%=khbh%>&dqbm=<%=dqbm%>&xmbh=<%=xmbh.trim()%>') >¼��</a></td>
          <td align="center" ><%=xmbh%></td>
          <td ><%=xmmc%></td>
          <td  ><%=sfxycl%></td>
          <td  ><%=bjjbmc%></td>
          <td  ><%=jldwmc%></td>
          <td> <%=bjlx%></td>
          <td> <%=slstr%></td>
        </tr>
        <%
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("��������: " + e);
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

if (row!=0)
{
	%>
        <tr bgcolor="#FFFFFF">
          <td colspan="15" >
		  <input name="button" type=button onClick="cf_checkAll(listform)" value='ȫѡ' >
            <input name="button" type=button onClick="cf_delete(listform)" value='ɾ����ѡ��Ŀ' >
        </tr>
        
        <%
}


%>
      </table>

</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<script  LANGUAGE="javascript">
<!--

var mark=1;
function cf_checkAll(formName)//ת���ַ���
{
	var i = 0;
	if (<%=row%>==1){
		if (mark==0)
		{
			formName.xhbox.checked =false
		}
		else{
			formName.xhbox.checked =true
		}
	}
	else if (<%=row%> >1){ 
		for (i=0;i< <%=row%>;i++ ){
			if (mark==0)
			{
				formName.xhbox[i].checked =false
			}
			else{
				formName.xhbox[i].checked =true
			}
		}
	}
	if (mark==0)
	{
		mark=1;
	}
	else{
		mark=0;
	}
}
function cf_delete(formName)
{
	var choo=0;
	if ( confirm("ע�⣡ɾ���󲻿ɻָ���ȷʵҪɾ��������?") )	{
		var i = 0;
		if (<%=row%>==1){
			if( formName.xhbox.checked ){
				choo=1;
			}
		} 
		else if (<%=row%>>1){ 
			for (i=0;i< <%=row%>;i++ ){
				if( formName.xhbox[i].checked ){
					choo=1;
				}
			} 
		} 
		if (choo == 0){
			alert("��ѡ����Ҫ����������");
			return false;
		}
		else{
			formName.target="_blank";
			formName.action="DeleteBj_bjxmmx.jsp";
			formName.submit();
			return true;
		}
	}
} 
function KeyDown()
{ 
	if ((event.ctrlKey))
	{ //���� Ctrl+n
		event.returnValue=false;
		alert('��ֹ����') ;
	}

	if ((event.ctrlKey)&&(event.keyCode==78))
	{ //���� Ctrl+n
		event.returnValue=false;
	}
	if ((event.shiftKey)&&(event.keyCode==121))
	{ //���� shift+F10
		event.returnValue=false;
	}
}
//-->
</script>

