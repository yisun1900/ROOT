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
	String yy_sj_zqs=null;
	String yy_sj_yy_sj_fgs=null;
	String yy_sj_yy_sjzky_mbkh=null;
	String yy_sj_yy_sjzky_sqdj=null;
	String yy_sj_yy_sjsjb_sjf=null;
	String yy_sj_yy_sjsjb_tqsjf=null;
	String yy_sj_yy_sjsjb_gccz=null;
	String yy_sj_yy_sjsjb_tqgccz=null;
	String yy_sj_yy_sjjjb_byjh=null;
	String yy_sj_yy_sjjjb_qntq=null;
	String yy_sj_yy_sjscb_mbkh=null;
	String yy_sj_yy_sjwxb_mbkh=null;
	String yy_sj_yy_sjqtqd_mbkh=null;
	String yy_sj_yy_sjscb_sqdj=null;
	String yy_sj_yy_sjwxb_sqdj=null;
	String yy_sj_yy_sjqtqd_sqdj=null;
	String yy_sj_yy_sj_lrsj=null;
	String yy_sj_lrr=null;
	yy_sj_zqs=request.getParameter("yy_sj_zqs");
	if (yy_sj_zqs!=null)
	{
		yy_sj_zqs=yy_sj_zqs.trim();
		if (!(yy_sj_zqs.equals("")))	wheresql+=" and (yy_sj.zqs="+yy_sj_zqs+") ";
	}
	yy_sj_yy_sj_fgs=request.getParameter("yy_sj_yy_sj_fgs");
	if (yy_sj_yy_sj_fgs!=null)
	{
		yy_sj_yy_sj_fgs=cf.GB2Uni(yy_sj_yy_sj_fgs);
		if (!(yy_sj_yy_sj_fgs.equals("")))	wheresql+=" and  (yy_sj.yy_sj_fgs='"+yy_sj_yy_sj_fgs+"')";
	}
	yy_sj_yy_sjzky_mbkh=request.getParameter("yy_sj_yy_sjzky_mbkh");
	if (yy_sj_yy_sjzky_mbkh!=null)
	{
		yy_sj_yy_sjzky_mbkh=yy_sj_yy_sjzky_mbkh.trim();
		if (!(yy_sj_yy_sjzky_mbkh.equals("")))	wheresql+=" and (yy_sj.yy_sjzky_mbkh="+yy_sj_yy_sjzky_mbkh+") ";
	}
	yy_sj_yy_sjzky_sqdj=request.getParameter("yy_sj_yy_sjzky_sqdj");
	if (yy_sj_yy_sjzky_sqdj!=null)
	{
		yy_sj_yy_sjzky_sqdj=yy_sj_yy_sjzky_sqdj.trim();
		if (!(yy_sj_yy_sjzky_sqdj.equals("")))	wheresql+=" and (yy_sj.yy_sjzky_sqdj="+yy_sj_yy_sjzky_sqdj+") ";
	}
	yy_sj_yy_sjsjb_sjf=request.getParameter("yy_sj_yy_sjsjb_sjf");
	if (yy_sj_yy_sjsjb_sjf!=null)
	{
		yy_sj_yy_sjsjb_sjf=yy_sj_yy_sjsjb_sjf.trim();
		if (!(yy_sj_yy_sjsjb_sjf.equals("")))	wheresql+=" and  (yy_sj.yy_sjsjb_sjf="+yy_sj_yy_sjsjb_sjf+") ";
	}
	yy_sj_yy_sjsjb_tqsjf=request.getParameter("yy_sj_yy_sjsjb_tqsjf");
	if (yy_sj_yy_sjsjb_tqsjf!=null)
	{
		yy_sj_yy_sjsjb_tqsjf=yy_sj_yy_sjsjb_tqsjf.trim();
		if (!(yy_sj_yy_sjsjb_tqsjf.equals("")))	wheresql+=" and  (yy_sj.yy_sjsjb_tqsjf="+yy_sj_yy_sjsjb_tqsjf+") ";
	}
	yy_sj_yy_sjsjb_gccz=request.getParameter("yy_sj_yy_sjsjb_gccz");
	if (yy_sj_yy_sjsjb_gccz!=null)
	{
		yy_sj_yy_sjsjb_gccz=yy_sj_yy_sjsjb_gccz.trim();
		if (!(yy_sj_yy_sjsjb_gccz.equals("")))	wheresql+=" and  (yy_sj.yy_sjsjb_gccz="+yy_sj_yy_sjsjb_gccz+") ";
	}
	yy_sj_yy_sjsjb_tqgccz=request.getParameter("yy_sj_yy_sjsjb_tqgccz");
	if (yy_sj_yy_sjsjb_tqgccz!=null)
	{
		yy_sj_yy_sjsjb_tqgccz=yy_sj_yy_sjsjb_tqgccz.trim();
		if (!(yy_sj_yy_sjsjb_tqgccz.equals("")))	wheresql+=" and  (yy_sj.yy_sjsjb_tqgccz="+yy_sj_yy_sjsjb_tqgccz+") ";
	}
	yy_sj_yy_sjjjb_byjh=request.getParameter("yy_sj_yy_sjjjb_byjh");
	if (yy_sj_yy_sjjjb_byjh!=null)
	{
		yy_sj_yy_sjjjb_byjh=yy_sj_yy_sjjjb_byjh.trim();
		if (!(yy_sj_yy_sjjjb_byjh.equals("")))	wheresql+=" and  (yy_sj.yy_sjjjb_byjh="+yy_sj_yy_sjjjb_byjh+") ";
	}
	yy_sj_yy_sjjjb_qntq=request.getParameter("yy_sj_yy_sjjjb_qntq");
	if (yy_sj_yy_sjjjb_qntq!=null)
	{
		yy_sj_yy_sjjjb_qntq=yy_sj_yy_sjjjb_qntq.trim();
		if (!(yy_sj_yy_sjjjb_qntq.equals("")))	wheresql+=" and  (yy_sj.yy_sjjjb_qntq="+yy_sj_yy_sjjjb_qntq+") ";
	}
	yy_sj_yy_sjscb_mbkh=request.getParameter("yy_sj_yy_sjscb_mbkh");
	if (yy_sj_yy_sjscb_mbkh!=null)
	{
		yy_sj_yy_sjscb_mbkh=yy_sj_yy_sjscb_mbkh.trim();
		if (!(yy_sj_yy_sjscb_mbkh.equals("")))	wheresql+=" and (yy_sj.yy_sjscb_mbkh="+yy_sj_yy_sjscb_mbkh+") ";
	}
	yy_sj_yy_sjwxb_mbkh=request.getParameter("yy_sj_yy_sjwxb_mbkh");
	if (yy_sj_yy_sjwxb_mbkh!=null)
	{
		yy_sj_yy_sjwxb_mbkh=yy_sj_yy_sjwxb_mbkh.trim();
		if (!(yy_sj_yy_sjwxb_mbkh.equals("")))	wheresql+=" and (yy_sj.yy_sjwxb_mbkh="+yy_sj_yy_sjwxb_mbkh+") ";
	}
	yy_sj_yy_sjqtqd_mbkh=request.getParameter("yy_sj_yy_sjqtqd_mbkh");
	if (yy_sj_yy_sjqtqd_mbkh!=null)
	{
		yy_sj_yy_sjqtqd_mbkh=yy_sj_yy_sjqtqd_mbkh.trim();
		if (!(yy_sj_yy_sjqtqd_mbkh.equals("")))	wheresql+=" and (yy_sj.yy_sjqtqd_mbkh="+yy_sj_yy_sjqtqd_mbkh+") ";
	}
	yy_sj_yy_sjscb_sqdj=request.getParameter("yy_sj_yy_sjscb_sqdj");
	if (yy_sj_yy_sjscb_sqdj!=null)
	{
		yy_sj_yy_sjscb_sqdj=yy_sj_yy_sjscb_sqdj.trim();
		if (!(yy_sj_yy_sjscb_sqdj.equals("")))	wheresql+=" and (yy_sj.yy_sjscb_sqdj="+yy_sj_yy_sjscb_sqdj+") ";
	}
	yy_sj_yy_sjwxb_sqdj=request.getParameter("yy_sj_yy_sjwxb_sqdj");
	if (yy_sj_yy_sjwxb_sqdj!=null)
	{
		yy_sj_yy_sjwxb_sqdj=yy_sj_yy_sjwxb_sqdj.trim();
		if (!(yy_sj_yy_sjwxb_sqdj.equals("")))	wheresql+=" and (yy_sj.yy_sjwxb_sqdj="+yy_sj_yy_sjwxb_sqdj+") ";
	}
	yy_sj_yy_sjqtqd_sqdj=request.getParameter("yy_sj_yy_sjqtqd_sqdj");
	if (yy_sj_yy_sjqtqd_sqdj!=null)
	{
		yy_sj_yy_sjqtqd_sqdj=yy_sj_yy_sjqtqd_sqdj.trim();
		if (!(yy_sj_yy_sjqtqd_sqdj.equals("")))	wheresql+=" and (yy_sj.yy_sjqtqd_sqdj="+yy_sj_yy_sjqtqd_sqdj+") ";
	}
	yy_sj_yy_sj_lrsj=request.getParameter("yy_sj_yy_sj_lrsj");
	if (yy_sj_yy_sj_lrsj!=null)
	{
		yy_sj_yy_sj_lrsj=yy_sj_yy_sj_lrsj.trim();
		if (!(yy_sj_yy_sj_lrsj.equals("")))	wheresql+="  and (yy_sj.yy_sj_lrsj>=TO_DATE('"+yy_sj_yy_sj_lrsj+"','YYYY/MM/DD'))";
	}
	yy_sj_yy_sj_lrsj=request.getParameter("yy_sj_yy_sj_lrsj2");
	if (yy_sj_yy_sj_lrsj!=null)
	{
		yy_sj_yy_sj_lrsj=yy_sj_yy_sj_lrsj.trim();
		if (!(yy_sj_yy_sj_lrsj.equals("")))	wheresql+="  and (yy_sj.yy_sj_lrsj<=TO_DATE('"+yy_sj_yy_sj_lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	yy_sj_lrr=request.getParameter("yy_sj_lrr");
	if (yy_sj_lrr!=null)
	{
		yy_sj_lrr=cf.GB2Uni(yy_sj_lrr);
		if (!(yy_sj_lrr.equals("")))	wheresql+=" and  (yy_sj.lrr='"+yy_sj_lrr+"')";
	}
	ls_sql="SELECT yy_sj.zqs,yy_sj.yy_sj_fgs,sq_dwxx.dwmc,yy_sj.yy_sjzky_mbkh,yy_sj.yy_sjzky_sqdj,yy_sj.yy_sjscb_mbkh,yy_sj.yy_sjscb_sqdj,yy_sj.yy_sjwxb_mbkh,yy_sj.yy_sjwxb_sqdj  ,yy_sj.yy_sjsjb_sjf,yy_sj.yy_sjsjb_tqsjf,yy_sj.yy_sjsjb_gccz,yy_sj.yy_sjsjb_tqgccz,yy_sj.yy_sjjjb_byjh,yy_sj.yy_sjjjb_qntq,yy_sj.yy_sjqtqd_mbkh,yy_sj.yy_sjqtqd_sqdj,yy_sj.yy_sj_lrsj,yy_sj.lrr  ";
	ls_sql+=" FROM sq_dwxx,yy_sj  ";
    ls_sql+=" where yy_sj.yy_sj_fgs=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by yy_sj.zqs,yy_sj.yy_sj_fgs";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Yy_sjList.jsp","","","EditYy_sj.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"zqs","yy_sj_fgs","sq_dwxx_dwmc","yy_sj_yy_sjzky_mbkh","yy_sj_yy_sjzky_sqdj","yy_sj_yy_sjsjb_sjf","yy_sj_yy_sjsjb_tqsjf","yy_sj_yy_sjsjb_gccz","yy_sj_yy_sjsjb_tqgccz","yy_sj_yy_sjjjb_byjh","yy_sj_yy_sjjjb_qntq","yy_sj_yy_sjscb_mbkh","yy_sj_yy_sjwxb_mbkh","yy_sj_yy_sjqtqd_mbkh","yy_sj_yy_sjscb_sqdj","yy_sj_yy_sjwxb_sqdj","yy_sj_yy_sjqtqd_sqdj","yy_sj_yy_sj_lrsj","yy_sj_lrr"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"zqs","yy_sj_fgs"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Yy_sjList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
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
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from yy_sj where "+chooseitem;
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
	pageObj.printPageLink(160);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="4%">������</td>
	<td  width="4%">�ֹ�˾</td>
	<td  width="7%">�ֹ�˾</td>
	<td  width="5%">�ܿ�ԴĿ��ͻ��������¼ƻ�</td>
	<td  width="5%">�ܿ�Դ��ȡ�����������¼ƻ�</td>

	<td  width="5%">�г���Ŀ��ͻ��������¼ƻ�</td>
	<td  width="5%">�г�����ȡ�����������¼ƻ�</td>
	<td  width="5%">������Ŀ��ͻ��������¼ƻ�</td>
	<td  width="5%">��������ȡ�����������¼ƻ�</td>

	<td  width="5%">��Ʋ���Ʒѱ��¼ƻ�</td>
	<td  width="5%">��Ʋ�ȥ��ͬ���¶���Ʒ�</td>
	<td  width="5%">��Ʋ����̲�ֵ���¼ƻ�</td>
	<td  width="5%">��Ʋ�ȥ��ͬ���¶ȹ��̲�ֵ</td>
	<td  width="5%">�ҾӲ����Ĳ�ֵ���¼ƻ�</td>
	<td  width="5%">�ҾӲ�ȥ��ͬ���¶����Ĳ�ֵ</td>

	<td  width="5%">��������Ŀ��ͻ��������¼ƻ�</td>
	<td  width="5%">����������ȡ�����������¼ƻ�</td>

	<td  width="6%">¼��ʱ��</td>
	<td  width="4%">¼����</td>
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