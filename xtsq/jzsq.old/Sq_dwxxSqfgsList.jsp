<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	ls_sql="SELECT sq_dwxx.dwbh,dwmc,ssdqmc,dqmc,(select dwmc from sq_dwxx a where a.dwbh=sq_dwxx.ssdw) ssdwmc,DECODE(dwlx,'A0','�ܲ�','A1','�ܲ�����','F0','�ֹ�˾','F1','�ֹ�˾����','F2','����','F3','����С��','J0','������') as dwlx,dwflmc,jryjbfb||'%',sq_dwxx.bianma,sq_dwxx.cwdm,sq_dwxx.hthqz,DECODE(sfjms,'Y','������','N','��'),DECODE(jcppbz,'Y','ȡ����','N','ȡ�����ֵ�'),DECODE(zcmmbz,'Y','ȡ����','N','ȡ�����ֵ�','M','�ɿ�'),DECODE(cgjjbz,'Y','ȡ����','N','ȡ�����ֵ�','M','�ɿ�'),DECODE(zxkhlrjc,'Y','����','N','������'),zxkhlrts,DECODE(qdkhbljc,'Y','����','N','������'),qdkhblts,DECODE(dzbjjc,'1','����[�ۿ���]��[ǩԼ��]','2','����[ǩԼ��]��[�ۿ���]','3','ȫ���˹�¼��','4','ǩԼ��ۿ��Զ�ȡ','5','ǩԼ���Զ�ȡ��¼���ۿ�'),DECODE(jcddblxs,2,'2λС��',1,'1λС��',0,'������λ',-1,'����ʮλ',-2,'������λ',-3,'����ǧλ'),hfsjzdsz,DECODE(sq_dwxx.xmzyglbz,'Y','����','N','������'),DECODE(sq_dwxx.jjgwglbz,'Y','����','N','������'),yjjzrq,DECODE(sq_dwxx.cxbz,'Y','����','N',''),sq_dwxx.kdsj,sq_dwxx.gdsj,sq_dwxx.bz";
	ls_sql+=" FROM sq_dwxx,dm_dqbm,sq_ssdqbm,dm_dwflbm ";
    ls_sql+=" where sq_dwxx.dqbm=dm_dqbm.dqbm(+) and sq_dwxx.ssdqbm=sq_ssdqbm.ssdqbm(+) and sq_dwxx.dwflbm=dm_dwflbm.dwflbm(+)";
    ls_sql+=" and sq_dwxx.dwlx in('A0','F0') and sq_dwxx.cxbz='N'";

	ls_sql+=" order by sq_dwxx.dqbm,sq_dwxx.ssfgs,sq_dwxx.cxbz,sq_dwxx.ssdw,sq_dwxx.dwlx,dwbh";

//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","PlOneFgsSq.jsp");
	pageObj.setPageRow(500);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"dwbh","dwmc","dwfzr","dwdh","dwcz","email"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"dwbh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("�ֹ�˾��Ȩ");
	pageObj.setEditBolt("");
//���ð�ť����
	String[] buttonName={"�๫˾������Ȩ"};//��ť����ʾ����
	String[] buttonLink={"PlFgsSq.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"dwbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewSq_dwxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("dwbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">���ֹ�˾������Ȩ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(310);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="2%">��λ���</td>
	<td  width="5%">��λ����</td>
	<td  width="3%">��������</td>
	<td  width="3%">��������</td>
	<td  width="5%">�ϼ���λ</td>
	<td  width="4%">��λ����</td>
	<td  width="4%">��λ����</td>
	<td  width="3%">����ҵ���տ����</td>
	<td  width="3%">����</td>
	<td  width="3%">�������</td>
	<td  width="3%">��ͬ��ǰ׺</td>
	<td  width="2%">�Ƿ������</td>
	<td  width="3%">Ͷ�߱��޹�Ӧ�̼��</td>
	<td  width="3%">����ľ���տ���</td>
	<td  width="3%">����Ҿ��տ���</td>
	<td  width="3%">������ѯ�ͻ�¼����</td>
	<td  width="3%">��ѯ�ͻ���ǰ¼������</td>
	<td  width="3%">����ǩ���ͻ���¼���</td>
	<td  width="3%">ǩ���ͻ���¼��������</td>
	<td  width="6%">���õ��ӱ��ۼ��</td>
	<td  width="3%">���ɶ�������С��</td>
	<td  width="3%">���ûط�ʱ���Զ�����</td>
	<td  width="3%">���ɶ�������ĿרԱ����</td>
	<td  width="3%">���ɶ����ԼҾӹ��ʹ���</td>
	<td  width="3%">����ҵ���Ľ�������</td>
	<td  width="2%">������־</td>
	<td  width="3%">����ʱ��</td>
	<td  width="3%">�ص�ʱ��</td>
	<td  width="7%">��ע</td>
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