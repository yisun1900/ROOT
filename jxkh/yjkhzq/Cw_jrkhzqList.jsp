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
	String cw_jrkhzq_khzq=null;
	String cw_jrkhzq_fgsbh=null;
	cw_jrkhzq_khzq=request.getParameter("cw_jrkhzq_khzq");
	if (cw_jrkhzq_khzq!=null)
	{
		cw_jrkhzq_khzq=cf.GB2Uni(cw_jrkhzq_khzq);
		if (!(cw_jrkhzq_khzq.equals("")))	wheresql+=" and  (cw_jrkhzq.khzq='"+cw_jrkhzq_khzq+"')";
	}
	cw_jrkhzq_fgsbh=request.getParameter("cw_jrkhzq_fgsbh");
	if (cw_jrkhzq_fgsbh!=null)
	{
		cw_jrkhzq_fgsbh=cf.GB2Uni(cw_jrkhzq_fgsbh);
		if (!(cw_jrkhzq_fgsbh.equals("")))	wheresql+=" and  (cw_jrkhzq.fgsbh='"+cw_jrkhzq_fgsbh+"')";
	}
	ls_sql="SELECT cw_jrkhzq.khzq,cw_jrkhzq.fgsbh,sq_dwxx.dwmc,cw_jrkhzq.khqssj,cw_jrkhzq.khjzsj,cw_jrkhzq.qqts,DECODE(sfkh,'1','δ����','2','¼������','3','����','4','���')  ";
	ls_sql+=" FROM cw_jrkhzq,sq_dwxx  ";
    ls_sql+=" where cw_jrkhzq.fgsbh=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_jrkhzq.fgsbh,cw_jrkhzq.khzq";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_jrkhzqList.jsp","","","EditCw_jrkhzq.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"khzq","fgsbh","sq_dwxx_dwmc","cw_jrkhzq_khqssj","cw_jrkhzq_khjzsj"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"khzq","fgsbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ","ɾ������","ɾ������"};//��ť����ʾ����
	String[] buttonLink={"Cw_jrkhzqList.jsp?","DeleteRw.jsp?","DeleteKh.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0,1,1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
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
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from cw_jrkhzq where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
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
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="10%">��������</td>
	<td  width="10%">�ֹ�˾</td>
	<td  width="25%">�ֹ�˾</td>
	<td  width="13%">������ʼʱ��</td>
	<td  width="13%">���˽���ʱ��</td>
	<td  width="10%">ȫ������</td>
	<td  width="10%">�Ƿ񿼺�</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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