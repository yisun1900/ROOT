<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
String yhmc=(String)session.getAttribute("yhmc");

String hth=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
String dwbh=null;
String ssfgs=null;


double qye=0;
String fwmj=null;
String pmjj=null;


String khlxbm=null;
String jzbz=null;

String qyrq=null;
String jyjdrq=null;
String kgrq=null;
String jgrq=null;

String bz=null;

String jlbz=null;
String pdsj=null;
String pdr=null;
String pdsm=null;
String sgd=null;
String sgdmc=null;
String sgbz=null;
String zjxm=null;

String mgfrz=null;
String nwgfrz=null;
String sdgfrz=null;
String yqgfrz=null;

String khbh=cf.GB2Uni(request.getParameter("khbh"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select hth,khxm,lxfs,fwdz,sjs,crm_khxx.dwbh,crm_khxx.fgsbh,pmjj,qye,fwmj,DECODE(jzbz,'1','��װ����','2','��װ����') jzbz,khlxbm ";
	ls_sql+=" ,qyrq,jyjdrq,kgrq,jgrq,crm_khxx.bz,jlbz,pdsj,pdr,pdsm,crm_khxx.sgd,sgdmc,sgbz,zjxm,mgfrz,nwgfrz,sdgfrz,yqgfrz ";
	ls_sql+=" from  crm_khxx,sq_sgd";
	ls_sql+=" where khbh='"+khbh+"' and crm_khxx.sgd=sq_sgd.sgd";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
		pmjj=cf.fillNull(rs.getString("pmjj"));
		qye=rs.getDouble("qye");
		jzbz=cf.fillNull(rs.getString("jzbz"));
		khlxbm=cf.fillNull(rs.getString("khlxbm"));

		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jyjdrq=cf.fillNull(rs.getDate("jyjdrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		bz=cf.fillNull(rs.getString("bz"));

		jlbz=cf.fillNull(rs.getString("jlbz"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		pdr=cf.fillNull(rs.getString("pdr"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		pdsm=cf.fillNull(rs.getString("pdsm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));

		mgfrz=cf.fillNull(rs.getString("mgfrz"));
		nwgfrz=cf.fillNull(rs.getString("nwgfrz"));
		sdgfrz=cf.fillNull(rs.getString("sdgfrz"));
		yqgfrz=cf.fillNull(rs.getString("yqgfrz"));
	}
	rs.close();
	ps.close();


%>

<html>
<head>
<title>�ɹ��ˣ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">

<form method="post" action="" name="editform" target="_blank">
      <div align="center">�ɹ��ˣ����</div>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td width="18%" align="right" bgcolor="#FFFFFF"> 
                <font color="#000099">�ͻ����</font>              </td>
              <td width="32%" bgcolor="#FFFFFF"> <font color="#000000"> <%=khbh%> 
              </font></td>
              <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#000099"> 
              ��ͬ��              </font></td>
              <td width="32%" bgcolor="#FFFFFF"> <font color="#000000"><%=hth%> 
                </font></td>
            </tr>
            <tr> 
              <td width="18%" bgcolor="#FFFFFF" align="right"><font color="#000099">�ͻ�����</font></td>
              <td width="32%" bgcolor="#FFFFFF"><font color="#000000"><%=khxm%></font></td>
              <td width="18%" bgcolor="#FFFFFF" align="right"><font color="#000099">���ʦ</font></td>
              <td width="32%" bgcolor="#FFFFFF"><font color="#000000"><%=sjs%>��<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%>�� </font></td>
            </tr>
            <tr>
              <td bgcolor="#FFFFFF" align="right"><font color="#000099">���ݵ�ַ</font></td>
              <td bgcolor="#FFFFFF"><font color="#000000"><%=fwdz%></font></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#000099">�ͻ�����</font></td>
              <td bgcolor="#FFFFFF"><font color="#000000">
                <%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm,true);
%>
              </font></td>
            </tr>
            
            <tr> 
              <td width="18%" bgcolor="#FFFFFF" align="right"><font color="#000099">����ǩԼ��</font></td>
              <td width="32%" bgcolor="#FFFFFF"><font color="#000000"><%=qye%></font></td>
              <td width="18%" bgcolor="#FFFFFF" align="right"><font color="#000099">�Ƿ��װ</font></td>
              <td width="32%" bgcolor="#FFFFFF"><font color="#000000"><%=jzbz%></font></td>
            </tr>
            <tr>
              <td align="right" bgcolor="#FFFFFF"><font color="#000099">�������</font></td>
              <td bgcolor="#FFFFFF"><font color="#000000"><%=fwmj%></font></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#000099">ÿƽ�׾���</font></td>
              <td bgcolor="#FFFFFF"><font color="#000000"><%=pmjj%></font></td>
            </tr>
            <tr> 
              <td width="18%" align="right" bgcolor="#FFFFFF"> 
                <font color="#000099">ǩԼ����</font>              </td>
              <td width="32%" bgcolor="#FFFFFF"> <font color="#000000"> <%=qyrq%> 
              </font></td>
              <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#000099">���齻������</font></td>
              <td width="32%" bgcolor="#FFFFFF"><font color="#000000"><%=jyjdrq%></font></td>
            </tr>
            
            <tr bgcolor="#FFCCCC">
              <td align="right" bgcolor="#FFFFFF"><font color="#000099">��ͬ��������</font></td>
              <td bgcolor="#FFFFFF"><font color="#000000"><%=kgrq%></font></td>
              <td align="right" bgcolor="#FFFFFF"><font color="#000099">��ͬ��������</font></td>
              <td bgcolor="#FFFFFF"><font color="#000000"><%=jgrq%></font></td>
            </tr>
            <tr> 
              <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#000099">��ע</font></td>
              <td colspan="3" bgcolor="#FFFFFF"><%=bz%></td>
            </tr>
            
            <tr> 
              <td width="18%" align="right" bgcolor="#FFFFCC"><font color="#000099"> 
              �ɵ�����              </font></td>
              <td width="32%" bgcolor="#FFFFCC"> 
                  <%
	cf.selectToken(out,"0+�˹��ɵ�&1+�ص�����&2+��˾����&3+���ʦָ���ɵ�&4+�ͻ�ָ���ɵ�&7+�������&9+ͬС���ɵ�",jlbz,true);
%>              </td>
              <td width="18%" align="right" bgcolor="#FFFFCC"><font color="#000099">�ʼ�</font></td>
              <td width="32%" bgcolor="#FFFFCC"><%=zjxm%></td>
            </tr>
            <tr> 
              <td width="18%" align="right" bgcolor="#FFFFCC"><font color="#000099"> 
              �ɵ���              </font></td>
              <td width="32%" bgcolor="#FFFFCC"><%=pdr%></td>
              <td width="18%" align="right" bgcolor="#FFFFCC"><font color="#000099"> 
              �ɵ�ʱ��              </font></td>
              <td width="32%" bgcolor="#FFFFCC"><%=pdsj%></td>
            </tr>
            
            <tr>
              <td bgcolor="#FFFFCC" align="right"><font color="#000099">ʩ����</font></td>
              <td bgcolor="#FFFFCC"><%=sgdmc%></td>
              <td bgcolor="#FFFFCC" align="right"><font color="#000099">�೤</font></td>
              <td bgcolor="#FFFFCC"><%=sgbz%></td>
            </tr>
            
            <tr>
              <td align="right" bgcolor="#FFFFCC"><font color="#000099"> ʩ�����ɵ�˵�� </font></td>
              <td colspan="3" bgcolor="#FFFFCC"><%=pdsm%></td>
            </tr>
            <tr align="center"> 
              <td colspan="4" height="2"> 
				<input type="hidden" name="khbh"  value="<%=khbh%>" >
                <input type="button"  value="�鿴��Ƭ" onClick="f_ck(editform)">
                <input type="reset"  value="����"></td>
            </tr>
        </table>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#CCCCCC" align="center"> 
              <td width="11%">�ϴ���Ƭ</td>
              <td width="11%">ɾ��</td>
              <td width="6%">����</td>
              <td width="6%">����</td>
              <td width="6%">�ɵ���</td>
              <td width="9%">�ɵ�ʱ��</td>
              <td width="6%">�����</td>
              <td width="9%">���ʱ��</td>
			  <td width="20%">��˾�Ǽ���Ƭ</td>
			  <td width="20%">�����Ƭ</td>
            </tr>
<%
	String grgz=null;
	String grxm=null;
	String grpdr=null;
	String grpdsj=null;
	String shr=null;
	String shsj=null;
	String zpmc=null;
	ls_sql="select grgz,grxm,pdr,pdsj,shr,shsj,zpmc";
	ls_sql+=" from  crm_grxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		grgz=cf.fillNull(rs.getString("grgz"));
		grxm=cf.fillNull(rs.getString("grxm"));
		grpdr=cf.fillNull(rs.getString("pdr"));
		grpdsj=cf.fillNull(rs.getString("pdsj"));
		shr=cf.fillNull(rs.getString("shr"));
		shsj=cf.fillNull(rs.getString("shsj"));
		zpmc=cf.fillNull(rs.getString("zpmc"));

		if (grgz.equals("���߹�"))
		{
			grgz="�߹�";
		}
		
		String zp="";
		ls_sql="select zp";
		ls_sql+=" from  sq_grxxb";
		ls_sql+=" where xm='"+grxm+"'";
		ls_sql+=" and gz='"+grgz+"'";
//		out.println(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zp=cf.fillNull(rs1.getString("zp"));
		}
		rs1.close();
		ps1.close();

		
		%>
		<tr bgcolor="#FFFFFF" align="center"> 
		  <td>
			<input type="button" onClick="f_sczp('<%=khbh%>','<%=grxm%>')"  value="�ϴ���Ƭ">
		  </td>
		  <td>
			<input type="button" onClick="f_del('<%=khbh%>','<%=grxm%>','<%=zpmc%>')"  value="ɾ����Ƭ">
		  </td>
		  <td><%=grgz%></td>
		  <td><%=grxm%></td>
		  <td><%=grpdr%></td>
		  <td><%=grpdsj%></td>
		  <td><%=shr%></td>
		  <td><%=shsj%></td>
		  <%
			if (zp.equals(""))
			{
				%>
				<td>����Ƭ</td>
				<%
			}
			else{
				%>
				<td><img src="/yblimg/grxx/<%=zp%>"  ></td>
				<%
			}
		  %>
		  <%
			if (zpmc.equals(""))
			{
				%>
				<td>����Ƭ</td>
				<%
			}
			else{
				%>
				<td><img src="/yblimg/grsh/<%=zpmc%>" ></td>
				<%
			}
		  %>
		</tr>
		<%

	}
	rs.close();
	ps.close();

%>

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
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>	
        </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_sczp(khbh,grxm)//����FormName:Form������
{
	if(new RegExp('Linux').test(navigator.platform.toString()))
	{
		var urlStr="loadWj.jsp?khbh="+khbh+"&grxm="+encodeURI(grxm);
		window.open(urlStr);
	}
	else
	{
		var urlStr="loadPhoto.jsp?khbh="+khbh+"&grxm="+encodeURI(grxm);
		window.open(urlStr);
	}
}

function f_del(khbh,grxm,zpmc)//����FormName:Form������
{
	if ( confirm("ȷʵҪ������?") )
	{
		var urlStr="deletePhoto.jsp?khbh="+khbh+"&grxm="+encodeURI(grxm)+"&zpmc="+encodeURI(zpmc);
		window.open(urlStr);
	}
}

function f_ck(FormName)//����FormName:Form������
{
	var urlStr="viewPhoto.jsp?khbh="+FormName.khbh.value;
	window.open(urlStr);
}


function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="SaveShCrm_khxx.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>

