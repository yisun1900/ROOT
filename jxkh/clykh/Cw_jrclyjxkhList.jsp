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
	String khzq=null;
	String fgsbh=null;
	String dwbh=null;
	String yhmc=null;
	khzq=request.getParameter("khzq");
	if (khzq!=null)
	{
		khzq=cf.GB2Uni(khzq);
		if (!(khzq.equals("")))	wheresql+=" and  (cw_jrclyjxkh.khzq='"+khzq+"')";
	}
	fgsbh=request.getParameter("fgsbh");
	if (fgsbh!=null)
	{
		fgsbh=cf.GB2Uni(fgsbh);
		if (!(fgsbh.equals("")))	wheresql+=" and  (cw_jrclyjxkh.fgsbh='"+fgsbh+"')";
	}
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (cw_jrclyjxkh.dwbh='"+dwbh+"')";
	}
	yhmc=request.getParameter("yhmc");
	if (yhmc!=null)
	{
		yhmc=cf.GB2Uni(yhmc);
		if (!(yhmc.equals("")))	wheresql+=" and  (cw_jrclyjxkh.yhmc='"+yhmc+"')";
	}
	ls_sql="SELECT cw_jrclyjxkh.khzq,cw_jrclyjxkh.khqssj,cw_jrclyjxkh.khjzsj,cw_jrclyjxkh.fgsbh,a.dwmc fgs,cw_jrclyjxkh.dwbh,b.dwmc,cw_jrclyjxkh.yhmc,DECODE(cw_jrclyjxkh.clzt,'1','δ���','2','���') clzt,cw_jrclyjxkh.khfs,tsl,tslfs,ddjdfs,xtsyfs,tsclfs,rcglfs,lckhfs,cw_jrclyjxkh.lrr,cw_jrclyjxkh.lrsj,cw_jrclyjxkh.bz  ";
	ls_sql+=" FROM cw_jrclyjxkh,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where cw_jrclyjxkh.fgsbh=a.dwbh(+)";
    ls_sql+=" and cw_jrclyjxkh.dwbh=b.dwbh(+)";
    ls_sql+=" and cw_jrclyjxkh.clzt='1'";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_jrclyjxkh.khzq,cw_jrclyjxkh.fgsbh,cw_jrclyjxkh.dwbh,cw_jrclyjxkh.yhmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_jrclyjxkhList.jsp","","","ChooseYhmc.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"khzq","khqssj","khjzsj","dwmc","yhmc","clzt","khfs","tsl","tslfs","ddjdfs","xtsyfs","tsclfs","rcglfs","lckhfs","lrr","lrsj","fgs","bz"};
	pageObj.setDisColName(disColName);


//��������
	String[] keyName={"khzq","fgsbh","dwbh","yhmc"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Cw_jrclyjxkhList.jsp"};//��ť�������õ���ҳ���������Ӳ���
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
	String chooseitem = cf.getParameter(request,"chooseitem");
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from cw_jrclyjxkh where clzt='1' and "+chooseitem;
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
  <B><font size="3">����Ա���ˣ�ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(180);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="3%">��������</td>
	<td  width="5%">������ʼʱ��</td>
	<td  width="5%">���˽���ʱ��</td>
	<td  width="9%">��������</td>
	<td  width="4%">����</td>
	<td  width="4%">���״̬</td>
	<td  width="5%">���˷���</td>
	<td  width="5%">Ͷ����</td>
	<td  width="5%">Ͷ�ߵ÷�</td>
	<td  width="5%">�������ȼ�¼</td>
	<td  width="5%">���淶ʹ��ϵͳ</td>
	<td  width="5%">Ͷ�߼�ʱ����</td>
	<td  width="5%">Υ���ճ������ƶ�</td>
	<td  width="5%">�ճ�ҵ�����̿���</td>
	<td  width="4%">¼����</td>
	<td  width="6%">¼��ʱ��</td>
	<td  width="8%">�ֹ�˾</td>
	<td  width="58%">��ע</td>
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