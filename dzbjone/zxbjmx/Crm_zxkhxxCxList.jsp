<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String yhmc=(String)session.getAttribute("yhmc");
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;

	String copykhbh=request.getParameter("copykhbh");
	String khxm=cf.GB2Uni(request.getParameter("khxm"));
	String ssfgs=request.getParameter("ssfgs");

	String khbh=request.getParameter("khbh");
	String dqbm=request.getParameter("dqbm");

	ls_sql="SELECT '�����˸�' fzrf,'��������' fzzc,'����ȫ��' fzqb,crm_zxkhxx.khxm,fwdz,DECODE(crm_zxkhxx.zxzt,'0','δ�������','1','�������','2','�����˻ؿͻ�','3','��ǩԼ','4','��˾ǩ��ʧ��','5','���·������'),dzbjze,bjjbmc,sq_dwxx.dwmc as zxdm,sjs,lrsj,crm_zxkhxx.khbh as khbh";
	ls_sql+=" FROM crm_zxkhxx,sq_dwxx,bdm_bjjbbm ";
    ls_sql+=" where crm_zxkhxx.zxdm=sq_dwxx.dwbh(+)";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and crm_zxkhxx.ssfgs='"+ssfgs+"' and crm_zxkhxx.khxm='"+khxm+"' and crm_zxkhxx.khbh='"+copykhbh+"'";
    ls_sql+=" order by crm_zxkhxx.khbh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��
	pageObj.setEditBolt("");//����ÿҳ��ʾ��¼��
	pageObj.setEditStr("����");//����ÿҳ��ʾ��¼��


//��������
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="CopyKhbj.jsp?drkhbh="+khbh+"&dqbm="+dqbm;//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("fzrf",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="CopyKhbjZc.jsp?drkhbh="+khbh+"&dqbm="+dqbm;//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("fzzc",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey2={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey2;//�����в�����coluParm.key������
	coluParm.link="CopyKhbjAll.jsp?drkhbh="+khbh+"&dqbm="+dqbm;//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("fzqb",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">���Ʊ��ۡ���ͬ���ʦ��Ҳ�ɸ��Ʊ��ۡ�</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="4%">&nbsp;</td>
	<td  width="4%">&nbsp;</td>
	<td  width="8%">����</td>
	<td  width="18%">��ַ</td>
	<td  width="8%">��ѯ״̬</td>
	<td  width="10%">���ӱ����ܶ�</td>
	<td  width="9%">���ۼ���</td>
	<td  width="11%">��ѯ����</td>
	<td  width="7%">���ʦ</td>
	<td  width="9%">¼��ʱ��</td>
	<td  width="6%">�ͻ����</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>