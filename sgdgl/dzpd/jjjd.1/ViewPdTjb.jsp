<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String sgd=cf.GB2Uni(request.getParameter("sgd"));

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ʩ�����ɵ�ͳ��</font></B>
</CENTER>
  <%	
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;

	ls_sql="SELECT crm_khxx.hth,crm_khxx.khxm,pdsj,pdr,DECODE(jlbz,'0','�����ɵ�','1','�ص�����','2','��˾����','3','���ʦָ���ɵ�','4','�ͻ�ָ���ɵ�','5','�󵥵�С��','6','С���ִ�'),pdsm,DECODE(kgzbz,'Y','�ѳ�','N','<font color=\"#FF00FF\">δ��</font>'),DECODE(NVL(tgbz,'W'),'W','����','N','<font color=\"#00FF00\">����</font>','Y','<font color=\"#FF0000\">��ͣ��</font>'),ysgcjdmc,crm_khxx.fwdz,crm_khxx.sjs,sgdmc sgd,crm_khxx.zjxm,c.gcyszxmmc ybysxmbm,d.gcyszxmmc zqysxmbm,a.dwmc qydm,crm_khxx.qyrq,jgrq,crm_khxx.qye";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm,dm_gcyszxmbm c,dm_gcyszxmbm d";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and crm_khxx.ybysxmbm=c.gcyszxmbm(+) and crm_khxx.zqysxmbm=d.gcyszxmbm(+) ";
    ls_sql+=" and crm_khxx.sgd='"+sgd+"' and crm_khxx.gcjdbm!='5' and zt='2'";
    ls_sql+=" order by pdsj";

//	out.println(ls_sql);
	pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"hth"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(140);
%>
  <tr bgcolor="#CCCCCC"  align="center"> 
	<td  width="5%">��ͬ��</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="5%">�ɵ�ʱ��</td>
	<td  width="4%">�ɵ���</td>
	<td  width="4%">�ɵ�����</td>
	<td  width="12%">�ɵ�˵��</td>
	<td  width="3%">����֤</td>
	<td  width="3%">ͣ��</td>
	<td  width="4%">���̽���</td>
	<td  width="17%">���ݵ�ַ</td>
	<td  width="3%">���ʦ</td>
	<td  width="3%">ʩ����</td>
	<td  width="3%">�ʼ�</td>
	<td  width="5%">���ι�������</td>
	<td  width="5%">��������</td>
	<td  width="7%">ǩԼ����</td>
	<td  width="5%">ǩԼ����</td>
	<td  width="5%">��ͬ��������</td>
	<td  width="4%">����ǩԼ��</td>
  </tr>

<%
	pageObj.displayDate();
%> 
</table>
</body>
</html>