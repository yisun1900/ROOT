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
	String bj_bjmb_yhdlm=null;
	String sq_yhxx_yhmc=null;
	String sq_yhxx_ssfgs=null;
	String sq_yhxx_dwbh=null;
	String sq_yhxx_sfzszg=null;
	String bj_bjmb_mbmc=null;
	String bj_bjmb_mblx=null;
	bj_bjmb_yhdlm=request.getParameter("bj_bjmb_yhdlm");
	if (bj_bjmb_yhdlm!=null)
	{
		bj_bjmb_yhdlm=cf.GB2Uni(bj_bjmb_yhdlm);
		if (!(bj_bjmb_yhdlm.equals("")))	wheresql+=" and  (bj_bjmb.yhdlm='"+bj_bjmb_yhdlm+"')";
	}
	sq_yhxx_yhmc=request.getParameter("sq_yhxx_yhmc");
	if (sq_yhxx_yhmc!=null)
	{
		sq_yhxx_yhmc=cf.GB2Uni(sq_yhxx_yhmc);
		if (!(sq_yhxx_yhmc.equals("")))	wheresql+=" and  (sq_yhxx.yhmc='"+sq_yhxx_yhmc+"')";
	}
	sq_yhxx_ssfgs=request.getParameter("sq_yhxx_ssfgs");
	if (sq_yhxx_ssfgs!=null)
	{
		sq_yhxx_ssfgs=cf.GB2Uni(sq_yhxx_ssfgs);
		if (!(sq_yhxx_ssfgs.equals("")))	wheresql+=" and  (sq_yhxx.ssfgs='"+sq_yhxx_ssfgs+"')";
	}
	sq_yhxx_dwbh=request.getParameter("sq_yhxx_dwbh");
	if (sq_yhxx_dwbh!=null)
	{
		sq_yhxx_dwbh=cf.GB2Uni(sq_yhxx_dwbh);
		if (!(sq_yhxx_dwbh.equals("")))	wheresql+=" and  (sq_yhxx.dwbh='"+sq_yhxx_dwbh+"')";
	}
	sq_yhxx_sfzszg=request.getParameter("sq_yhxx_sfzszg");
	if (sq_yhxx_sfzszg!=null)
	{
		sq_yhxx_sfzszg=cf.GB2Uni(sq_yhxx_sfzszg);
		if (!(sq_yhxx_sfzszg.equals("")))	wheresql+=" and  (sq_yhxx.sfzszg='"+sq_yhxx_sfzszg+"')";
	}
	bj_bjmb_mbmc=request.getParameter("bj_bjmb_mbmc");
	if (bj_bjmb_mbmc!=null)
	{
		bj_bjmb_mbmc=cf.GB2Uni(bj_bjmb_mbmc);
		if (!(bj_bjmb_mbmc.equals("")))	wheresql+=" and  (bj_bjmb.mbmc like '%"+bj_bjmb_mbmc+"%')";
	}
	bj_bjmb_mblx=request.getParameter("bj_bjmb_mblx");
	if (bj_bjmb_mblx!=null)
	{
		bj_bjmb_mblx=cf.GB2Uni(bj_bjmb_mblx);
		if (!(bj_bjmb_mblx.equals("")))	wheresql+=" and  (bj_bjmb.mblx='"+bj_bjmb_mblx+"')";
	}
	ls_sql="SELECT distinct sq_yhxx.ssfgs,sq_yhxx.dwbh,bj_bjmb.mbmc, DECODE(bj_bjmb.mblx,'1','����ģ��','2','˽��ģ��') mblx,a.dwmc fgsmc,b.dwmc bmmc,bj_bjmb.yhdlm,sq_yhxx.yhmc,DECODE(sq_yhxx.sfzszg,'M','ʵϰ��','Y','ת��','N','������','D','����','S','��ְ','T','����') sfzszg";
	ls_sql+=" FROM sq_yhxx,bj_bjmb,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where bj_bjmb.yhdlm=sq_yhxx.yhdlm(+)";
	ls_sql+=" and sq_yhxx.ssfgs=a.dwbh(+) and sq_yhxx.dwbh=b.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by sq_yhxx.ssfgs,sq_yhxx.dwbh,sq_yhxx.yhmc,bj_bjmb.mbmc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Bj_bjmbList.jsp","SelectBj_bjmb.jsp","ViewBj_bjmb.jsp","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"mbmc","mblx","fgsmc","bmmc","yhdlm","yhmc","sfzszg"};
	pageObj.setDisColName(disColName);


//��������
	String[] keyName={"yhdlm","mbmc"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ","תΪ����ģ��"};//��ť����ʾ����
	String[] buttonLink={"Bj_bjmbList.jsp?","ToGymb.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0,1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
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
	String chooseitem =request.getParameter("chooseitem");
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[3];//Ҫִ�е�SQL
		boolean needCommit=true;//����Ҫ������
		sql[0]="delete from bj_bjmbgclmx where "+chooseitem;
		sql[1]="delete from bj_bjmbfjxx where "+chooseitem;
		sql[2]="delete from bj_bjmb where "+chooseitem;
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
  <B><font size="3">��װģ��--ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">&nbsp;</td>
	<td  width="25%">ģ������</td>
	<td  width="8%">ģ������</td>
	<td  width="12%">�����ֹ�˾</td>
	<td  width="16%">��������</td>
	<td  width="12%">�û���½��</td>
	<td  width="8%">Ա������</td>
	<td  width="8%">Ա��״̬</td>
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