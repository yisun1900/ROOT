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
	String pxjhbh=null;
	pxjhbh=request.getParameter("pxjhbh");
	if (pxjhbh!=null)
	{
		pxjhbh=cf.GB2Uni(pxjhbh);
		if (!(pxjhbh.equals("")))	wheresql+=" and  (pxjhbh='"+pxjhbh+"')";
	}
	ls_sql="SELECT pxmxbh,pxjhbh,rs_pxskxsbm.skxsmc skxs,rs_pxkclxbm.lxmc kclx,pxcd,pxrs,pxfy,gcrs,zcrs,jcrs,pxjs,DECODE(pxjg,'0','δ���','1','���','2','�������') pxjg,pxkssj,pxjssj,lrr,lrsj,pxkc,kcnr,bz  ";
	ls_sql+=" FROM rs_pxzjmx,rs_pxskxsbm,rs_pxkclxbm  ";
    ls_sql+=" where rs_pxzjmx.skxs=rs_pxskxsbm.skxs and rs_pxzjmx.kclx=rs_pxkclxbm.kclx  ";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_pxzjmxList.jsp","","","EditRs_pxzjmx.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"pxmxbh","pxjhbh","skxs","kclx","pxkc","kcnr","pxcd","pxrs","pxfy","gcrs","zcrs","jcrs","pxjs","pxjg","pxkssj","pxjssj","lrr","lrsj","bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"pxmxbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Rs_deleteZjmx.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
//	String[] pxmxbh = request.getParameterValues("pxmxbh");
//	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(pxmxbh,"pxmxbh"));
//	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
//	{
//		String[] sql=new String[1];//Ҫִ�е�SQL
//		boolean needCommit=false;//����Ҫ������
//		sql[0]="delete from rs_pxzjmx where "+chooseitem;
//		pageObj.execDelete(sql,needCommit);
//	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="5%">��ѵ��ϸ���</td>
	<td  width="5%">��ѵ�ƻ����</td>
	<td  width="4%">�ڿ���ʽ</td>
	<td  width="4%">�γ�����</td>
	<td  width="4%">��ѵ����</td>
	<td  width="4%">��ѵ����</td>
	<td  width="4%">��ѵ����</td>
	<td  width="4%">�߲�����</td>
	<td  width="4%">�в�����</td>
	<td  width="4%">��������</td>
	<td  width="4%">��ѵ��ʦ</td>
	<td  width="4%">��ѵ���</td>
	<td  width="5%">��ѵ��ʼʱ��</td>
	<td  width="5%">��ѵ����ʱ��</td>
	<td  width="4%">¼����</td>
	<td  width="4%">¼��ʱ��</td>
	<td  width="5%">��ѵ�γ�</td>
	<td  width="5%">�γ�����</td>
	<td  width="6%">��ע</td>
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