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
	String sq_gysbm_gysbm=null;
	String sq_gysbm_gys=null;
	String dqbm=null;
	String sq_gysbm_gysdz=null;
	String sq_gysbm_gysfzr=null;
	String sq_gysbm_gysdh=null;
	String sq_gysbm_gyscz=null;
	String sq_gysbm_email=null;

	String sq_gysxx_gyslb=null;
	String sq_gysxx_zclb=null;

	sq_gysxx_gyslb=request.getParameter("sq_gysxx_gyslb");
	if (sq_gysxx_gyslb!=null)
	{
		sq_gysxx_gyslb=cf.GB2Uni(sq_gysxx_gyslb);
		if (!(sq_gysxx_gyslb.equals("")))	wheresql+=" and  (sq_gysxx.gyslb='"+sq_gysxx_gyslb+"')";
	}
	sq_gysxx_zclb=request.getParameter("sq_gysxx_zclb");
	if (sq_gysxx_zclb!=null)
	{
		sq_gysxx_zclb=cf.GB2Uni(sq_gysxx_zclb);
		if (!(sq_gysxx_zclb.equals("")))	wheresql+=" and  (sq_gysxx.zclb='"+sq_gysxx_zclb+"')";
	}

	String sfsq=null;
	sfsq=request.getParameter("sfsq");
	if (sfsq!=null)
	{
		if (sfsq.equals("Y"))
		{
			wheresql+=" and  (sq_gysbm.yhdlm in(select yhdlm from sq_yhssz))";
		}
		else if (sfsq.equals("N"))
		{
			wheresql+=" and  (sq_gysbm.yhdlm not in(select yhdlm from sq_yhssz) or sq_gysbm.yhdlm is null)";
		}
	}

	String yhdlm=null;
	yhdlm=request.getParameter("yhdlm");
	if (yhdlm!=null)
	{
		yhdlm=cf.GB2Uni(yhdlm);
		if (!(yhdlm.equals("")))	wheresql+=" and  (sq_gysbm.yhdlm='"+yhdlm+"')";
	}

	String yhkl=null;
	yhkl=request.getParameter("yhkl");
	if (yhkl!=null)
	{
		yhkl=cf.GB2Uni(yhkl);
		if (!(yhkl.equals("")))	wheresql+=" and  (sq_gysbm.yhkl='"+yhkl+"')";
	}

	String yhmc=null;
	yhmc=request.getParameter("yhmc");
	if (yhmc!=null)
	{
		yhmc=cf.GB2Uni(yhmc);
		if (!(yhmc.equals("")))	wheresql+=" and  (sq_gysbm.yhmc like '%"+yhmc+"%')";
	}


	sq_gysbm_gysbm=request.getParameter("sq_gysbm_gysbm");
	if (sq_gysbm_gysbm!=null)
	{
		sq_gysbm_gysbm=cf.GB2Uni(sq_gysbm_gysbm);
		if (!(sq_gysbm_gysbm.equals("")))	wheresql+=" and  (sq_gysbm.gysbm='"+sq_gysbm_gysbm+"')";
	}
	sq_gysbm_gys=request.getParameter("sq_gysbm_gys");
	if (sq_gysbm_gys!=null)
	{
		sq_gysbm_gys=cf.GB2Uni(sq_gysbm_gys);
		if (!(sq_gysbm_gys.equals("")))	wheresql+=" and  (sq_gysbm.gys like '%"+sq_gysbm_gys+"%')";
	}

	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (sq_gysbm.dqbm='"+dqbm+"')";
	}
	sq_gysbm_gysdz=request.getParameter("sq_gysbm_gysdz");
	if (sq_gysbm_gysdz!=null)
	{
		sq_gysbm_gysdz=cf.GB2Uni(sq_gysbm_gysdz);
		if (!(sq_gysbm_gysdz.equals("")))	wheresql+=" and  (sq_gysbm.gysdz='"+sq_gysbm_gysdz+"')";
	}
	sq_gysbm_gysfzr=request.getParameter("sq_gysbm_gysfzr");
	if (sq_gysbm_gysfzr!=null)
	{
		sq_gysbm_gysfzr=cf.GB2Uni(sq_gysbm_gysfzr);
		if (!(sq_gysbm_gysfzr.equals("")))	wheresql+=" and  (sq_gysbm.gysfzr='"+sq_gysbm_gysfzr+"')";
	}
	sq_gysbm_gysdh=request.getParameter("sq_gysbm_gysdh");
	if (sq_gysbm_gysdh!=null)
	{
		sq_gysbm_gysdh=cf.GB2Uni(sq_gysbm_gysdh);
		if (!(sq_gysbm_gysdh.equals("")))	wheresql+=" and  (sq_gysbm.gysdh='"+sq_gysbm_gysdh+"')";
	}
	sq_gysbm_gyscz=request.getParameter("sq_gysbm_gyscz");
	if (sq_gysbm_gyscz!=null)
	{
		sq_gysbm_gyscz=cf.GB2Uni(sq_gysbm_gyscz);
		if (!(sq_gysbm_gyscz.equals("")))	wheresql+=" and  (sq_gysbm.gyscz='"+sq_gysbm_gyscz+"')";
	}
	sq_gysbm_email=request.getParameter("sq_gysbm_email");
	if (sq_gysbm_email!=null)
	{
		sq_gysbm_email=cf.GB2Uni(sq_gysbm_email);
		if (!(sq_gysbm_email.equals("")))	wheresql+=" and  (sq_gysbm.email='"+sq_gysbm_email+"')";
	}

	String px=request.getParameter("px");
	
	ls_sql="SELECT distinct sq_gysbm.dqbm,sq_gysbm.yxdlsbcs||'��' yxdlsbcs,sq_gysbm.mmsyzq||'��' mmsyzq,sq_gysbm.lxdlsbcs,sq_gysbm.mmxgsj,sq_gysbm.gysbm,'�޸�' xg,sq_gysbm.gys,sq_gysbm.yhdlm,sq_gysbm.yhkl,DECODE(sq_gysbm.kdlxtbz,'Y','����','N','���ɵ�½') kdlxtbz,sq_gysbm.yhmc,sq_gysbm.cwdm,yhzmc,sq_gysbm.gysdh,sq_gysbm.gyscz, sq_gysbm.gysdz,sq_gysbm.gysfzr,sq_gysbm.email, sq_gysbm.bz,dm_dqbm.dqmc  ";
	ls_sql+=" FROM dm_dqbm,sq_gysbm,sq_yhssz,sq_yhz,sq_gysxx  ";
    ls_sql+=" where sq_gysbm.dqbm=dm_dqbm.dqbm ";
	ls_sql+=" and sq_gysbm.yhdlm=sq_yhssz.yhdlm(+) and sq_yhssz.yhzbh =sq_yhz.yhzbh(+)";
    ls_sql+=" and sq_gysbm.gysbm=sq_gysxx.gysbm(+) ";
    ls_sql+=wheresql;
	if (px.equals(""))
	{
		ls_sql+=" order by sq_gysbm.dqbm,sq_gysbm.gys";
	}
	else{
		ls_sql+=" order by "+px;
	}
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Sq_gysbmList.jsp","SelectSq_gysbm.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"gysbm","gys","dqmc","xg","yhdlm","yhkl","kdlxtbz","yxdlsbcs","lxdlsbcs","mmsyzq","mmxgsj","yhmc","cwdm","yhzmc","gysdh","gyscz","gysdz","gysfzr","email","bz"};
	pageObj.setDisColName(disColName);

//��������
	String[] keyName={"gysbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteSq_gysbm.jsp?dqbm="+dqbm};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("gysbm","1");//�в����������Hash��
	spanColHash.put("gys","1");//�в����������Hash��
	spanColHash.put("dqmc","1");//�в����������Hash��
	spanColHash.put("xg","1");//�в����������Hash��
	spanColHash.put("yhdlm","1");//�в����������Hash��
	spanColHash.put("yhkl","1");//�в����������Hash��
	spanColHash.put("kdlxtbz","1");//�в����������Hash��
	spanColHash.put("yxdlsbcs","1");//�в����������Hash��
	spanColHash.put("lxdlsbcs","1");//�в����������Hash��
	spanColHash.put("mmsyzq","1");//�в����������Hash��
	spanColHash.put("mmxgsj","1");//�в����������Hash��
	spanColHash.put("yhmc","1");//�в����������Hash��
	spanColHash.put("cwdm","1");//�в����������Hash��
	spanColHash.put("gysdh","1");//�в����������Hash��
	spanColHash.put("gyscz","1");//�в����������Hash��
	spanColHash.put("gysdz","1");//�в����������Hash��
	spanColHash.put("gysfzr","1");//�в����������Hash��
	spanColHash.put("email","1");//�в����������Hash��
	spanColHash.put("bz","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"gysbm"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewSq_gysbm.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("gysbm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"gysbm"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="EditSq_gysbm.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("xg",coluParm);//�в����������Hash��
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
  <B><font size="3">ά����Ӧ��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(300);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="2%">��Ӧ�̱��</td>
	<td  width="9%">��Ӧ������</td>
	<td  width="3%">��������</td>
	<td  width="2%">&nbsp;</td>
	<td  width="4%">�û���¼��</td>
	<td  width="4%">�û�����</td>
	<td  width="2%">�ɵ�½ϵͳ</td>
	<td  width="2%">�����½ʧ��</td>
	<td  width="2%">ʧ�ܴ���</td>
	<td  width="2%">����ʹ������</td>
	<td  width="3%">�����޸�ʱ��</td>
	<td  width="6%">�û�����</td>
	<td  width="4%">�������</td>
	<td  width="6%">�û�������</td>
	<td  width="8%">��Ӧ�̵绰</td>
	<td  width="7%">��Ӧ�̴���</td>
	<td  width="8%">��Ӧ�̵�ַ</td>
	<td  width="4%">��Ӧ�̸�����</td>
	<td  width="6%">EMail</td>
	<td  width="15%">��ע</td>
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